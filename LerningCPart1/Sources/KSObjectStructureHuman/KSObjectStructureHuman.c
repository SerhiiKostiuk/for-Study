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
#include "KSObjectStructureHuman.h"

#define KSReturnObjectFieldOrValue(object, fieldName, nullValue)\
        NULL != object ? object->fieldName : nullValue

#pragma mark -
#pragma mark Private Declarations

static
void KSObjectRetain(KSHuman *object);

void KSObjectRelease(KSHuman *object);

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

static
void KSHumanRemoveKid(KSHuman *parent, KSHuman *kid);

#pragma mark -
#pragma mark Initializations & Dealocation

void _KSHumanDeallocate(KSHuman *object) {
    KSHumanSetName(object, NULL);
    KSHumanUnsignedSetPartner(object, NULL);
    KSHumanRemoveKid(object, NULL);
    KSHumanSetMother(object, NULL);
    KSHumanSetFather(object, NULL);
    KSHumanSetDivorce(object);
    
    
    free(object);
}

KSHuman *KSHumanCreate(void) {
    return KSHumanCreateWithParameters(kKSHumanGenderUndefiened, NULL, 1);
}

KSHuman *KSHumanCreateWithParameters(KSHumanGenderType gender, char *name, uint8_t age) {
    KSHuman *person = calloc(1,sizeof(KSHuman));
    assert(person != NULL);
    
    KSHumanSetGender(person,gender);
    KSHumanSetName(person, name);
    KSHumanSetAge(person, age);
    person->_referenceCount = 1;
    
    return person;
}

KSHuman *KSHumanCreateKidWithParameters(KSHumanGenderType gender, KSHuman *mother, KSHuman *father, char *name) {
    KSHuman *person = KSHumanCreateWithParameters(gender, name, kKSPrimaryAge);
    
    KSHumanSetMother(person, mother);
    KSHumanSetFather(person, father);
    KSHumanAddKid(mother,person);
    KSHumanAddKid(father,person);
    
    return person;
}

#pragma mark -
#pragma mark Accessors

char *KSHumanName(KSHuman *object) {
    return KSReturnObjectFieldOrValue(object,_name,NULL);
}

void KSHumanSetName(KSHuman *object, char *name) {
    if (NULL == object && object->_name == name) {
        return;
    }
    
    if (NULL != object->_name) {
        free(object->_name);
        object->_name = NULL;
    }
    
    if (name) {
        object->_name = strdup(name);
    }
}


KSHuman *KSHumanPartner(KSHuman *object) {
    return KSReturnObjectFieldOrValue(object, _partner, NULL);
}

void KSHumanSetPartner(KSHuman *object, KSHuman *partner) {
    if (NULL != object && object->_partner != partner) {
        KSObjectRelease(object->_partner);
        object->_partner = partner;
        KSObjectRetain(partner);
    }
}

void KSHumanUnsignedSetPartner(KSHuman *object, KSHuman *partner) {
    if (NULL != object && object->_partner != partner) {
        object->_partner = partner;
    }
}

KSHuman *KSHumanMother(KSHuman *object) {
    return KSReturnObjectFieldOrValue(object, _mother, NULL);
}

void KSHumanSetMother(KSHuman *object, KSHuman *mother) {
    if (NULL != object && object->_mother != mother) {
        object->_mother = mother;
    }
}

KSHuman *KSHumanFather(KSHuman *object) {
    return KSReturnObjectFieldOrValue(object, _father, NULL);
}

void KSHumanSetFather(KSHuman *object, KSHuman *father) {
    if (NULL != object && object->_father != father) {
        object->_father = father;
    }
}

KSHumanGenderType KSHumanGender(KSHuman *object) {
    return KSReturnObjectFieldOrValue(object, _gender, 0);
}

void KSHumanSetGender(KSHuman *object, KSHumanGenderType gender) {
    if (NULL != object) {
        object->_gender = gender;
    }
}

uint8_t KSHumanKidsCount(KSHuman *object) {
    return KSReturnObjectFieldOrValue(object, _kidsCount, 0);
}

uint8_t KSHumanAge(KSHuman *object) {
    return KSReturnObjectFieldOrValue(object, _age, 0);
}

void KSHumanSetAge(KSHuman *object, uint8_t age) {
    if (NULL != object) {
        object->_age = age;
    }
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
    
    KSHumanSetPartner(partner, object);
    KSHumanUnsignedSetPartner(object, partner);
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
        
//        if (childIndex >kKSKidsLimit-1) {
//            parent->_kids[childIndex]=0;
//        }else {
//            parent->_kids[childIndex]=parent->_kids[childIndex+1];
//        }
        
        if (kid == child) {
            kKSHumanGenderFemale == KSHumanGender(parent)
                                    ? KSHumanSetMother(child, NULL)
                                    : KSHumanSetFather(child, NULL);
            parent->_kids[childIndex] = NULL;
            KSObjectRelease(child);
            parent->_kidsCount--;
        }
    }
}

#pragma mark -
#pragma mark Public Implementations

void KSObjectRetain(KSHuman *object) {
    if (object) {
        object->_referenceCount++;
    }
}

void KSObjectRelease(KSHuman *object) {
    if (NULL != object) {
        if (0 == --(object->_referenceCount)) {
            _KSHumanDeallocate(object);
        }
    }
}

