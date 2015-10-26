//
//  objectStructureHuman.c
//  LerningCPart1
//
//  Created by Serg Bla on 02.10.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#include <stdbool.h>
#include <stdlib.h>
#include <assert.h>
#include <string.h>
#include "KSHuman.h"
#include "KSObject.h"
#include "KSMacros.h"
#include "KSString.h"


#pragma mark -
#pragma mark Private Declarations

static
void KSHumanSetPartner(KSHuman *object, KSHuman *partner);

static
void KSHumanUnsignedSetPartner(KSHuman *object, KSHuman *partner);

static
void KSHumanSetMother(KSHuman *object, KSHuman *mother);

static
void KSHumanSetFather(KSHuman *object, KSHuman *father);

static
void KSHumanSetGender(KSHuman *object, KSHumanGenderType gender);

static
void KSHumanAddKid(KSHuman *parent, KSHuman *kid);


void KSHumanRemoveKid(KSHuman *parent, KSHuman *kid);

#pragma mark -
#pragma mark Initializations & Dealocation

void __KSHumanDeallocate(void *object) {
    KSHumanSetName(object, NULL);
    KSHumanUnsignedSetPartner(object, NULL);
    KSHumanRemoveKid(object, NULL);
    KSHumanSetMother(object, NULL);
    KSHumanSetFather(object, NULL);
    KSHumanSetDivorce(object);
    
    __KSObjectDeallocate(object);
}

KSHuman *KSHumanCreate(void) {
    return KSHumanCreateWithParameters(kKSHumanGenderUndefiened, NULL, 1);
}

KSHuman *KSHumanCreateWithParameters(KSHumanGenderType gender, KSString *name, uint8_t age) {
    KSHuman *person = KSObjectCreateOfType(KSHuman);
    
    KSHumanSetGender(person,gender);
    KSHumanSetName(person, name);
    KSHumanSetAge(person, age);
    
    return person;
}

KSHuman *KSHumanCreateKidWithParameters(KSHumanGenderType gender, KSHuman *mother, KSHuman *father, KSString *name) {
    KSHuman *person = KSHumanCreateWithParameters(gender, name, kKSPrimaryAge);
    
    KSHumanSetMother(person, mother);
    KSHumanSetFather(person, father);
    KSHumanAddKid(mother,person);
    KSHumanAddKid(father,person);
    
    return person;
}

#pragma mark -
#pragma mark Accessors

KSString *KSHumanName(KSHuman *object) {
    return KSObjectFieldOrValue(object, _name, NULL);
}

void KSHumanSetName(KSHuman *object, KSString *name) {
    KSObjectRetainingSetter(object, _name, name)
}

KSHuman *KSHumanPartner(KSHuman *object) {
    return KSObjectFieldOrValue(object, _partner, NULL);
}

void KSHumanSetPartner(KSHuman *object, KSHuman *partner) {
    if (NULL != object && object->_partner != partner) {
        KSObjectRelease(object->_partner);
        object->_partner = partner;
        KSObjectRetain(partner);
    }
}

void KSHumanUnsignedSetPartner(KSHuman *object, KSHuman *partner) {
    KSObjectCheckAndAddedNewValue(object, _partner, partner)
}

KSHuman *KSHumanMother(KSHuman *object) {
    return KSObjectFieldOrValue(object, _mother, NULL);
}

void KSHumanSetMother(KSHuman *object, KSHuman *mother) {
    KSObjectCheckAndAddedNewValue(object, _mother, mother)

}

KSHuman *KSHumanFather(KSHuman *object) {
    return KSObjectFieldOrValue(object, _father, NULL);
}

void KSHumanSetFather(KSHuman *object, KSHuman *father) {
    KSObjectCheckAndAddedNewValue(object, _father, father)

}

KSHumanGenderType KSHumanGender(KSHuman *object) {
    return KSObjectFieldOrValue(object, _gender, 0);
}

void KSHumanSetGender(KSHuman *object, KSHumanGenderType gender) {
    KSObjectCheckAndAddedNewValue(object, _gender, gender)
}

uint8_t KSHumanKidsCount(KSHuman *object) {
    return KSObjectFieldOrValue(object, _kidsCount, 0);
}

uint8_t KSHumanAge(KSHuman *object) {
    return KSObjectFieldOrValue(object, _age, 0);
}

void KSHumanSetAge(KSHuman *object, uint8_t age) {
    KSObjectCheckAndAddedNewValue(object, _age, age)

}

void KSHumanSetDivorce(KSHuman *object) {
    if (NULL != object && NULL != object->_partner) {
        KSHumanSetPartner(object, NULL);
    }
}

void KSHumanSetMarry(KSHuman *object, KSHuman *partner) {
    assert(object->_partner == object->_partner && KSHumanGender(object) != KSHumanGender(partner));
    
    if (NULL != object/* && NULL != object->_partner*/) {
        KSHumanSetDivorce(object);
        KSHumanSetDivorce(partner);
    }
//#warning identification of gender for human whos master
    KSHumanSetPartner(partner, object);
 //   KSHumanUnsignedSetPartner(object, partner);
}

#pragma mark -
#pragma mark Private Implementations

void KSHumanAddKid(KSHuman *parent, KSHuman *kid) {
    if (NULL == kid || NULL == parent) {
        return;
    }
    
    if (NULL != kid) {
        kKSHumanGenderFemale == KSHumanGender(parent) ? KSHumanSetMother(kid, parent) : KSHumanSetFather(kid, parent);
        
        for (uint8_t childIndex = 0; childIndex < kKSKidsLimit; childIndex++) {
            if(NULL == parent->_kids[childIndex]){
                parent->_kids[childIndex] = kid;
                KSObjectRetain(kid);
                parent->_kidsCount++;
                
                return;
            }
        }
    }
}

void KSHumanRemoveKid(KSHuman *parent, KSHuman *kid) {
    if (NULL == kid || NULL == parent) {
        return;
    }
    
    for (uint8_t childIndex = 0; childIndex < kKSKidsLimit; childIndex++) {
        KSHuman *child = parent->_kids[childIndex];
        if (kid == child) {
            kKSHumanGenderFemale == KSHumanGender(parent)
                                    ? KSHumanSetMother(NULL, child)
                                    : KSHumanSetFather(child, NULL);
            parent->_kids[childIndex] = NULL;
            KSObjectRelease(child);
            parent->_kidsCount--;
            
            for (uint8_t index = childIndex; index < kKSKidsLimit - 1; index++) {
                parent->_kids[index] = parent->_kids[index + 1];
            }
        }
        parent->_kids[kKSKidsLimit - 1] = NULL;
    }
}
