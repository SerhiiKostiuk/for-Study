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
void KSHumanSetMother(KSHuman *object, KSHuman *mother);

static
void KSHumanSetFather(KSHuman *object, KSHuman *father);

static
void KSHumanSetKid(KSHuman *object, KSArray *array);

static
void KSHumanSetGender(KSHuman *object, KSHumanGenderType gender);

static
void KSHumanAddKid(KSHuman *parent, KSHuman *kid);

static
void KSHumanRemoveAllKids(KSHuman *object);

#pragma mark -
#pragma mark Initializations & Dealocation

void __KSHumanDeallocate(void *object) {
    KSHumanSetPartner(object, NULL);
    KSHumanSetName(object, NULL);
    KSHumanRemoveAllKids(object);
    KSHumanSetMother(object, NULL);
    KSHumanSetFather(object, NULL);
    
    __KSObjectDeallocate(object);
}

KSHuman *KSHumanCreate(void) {
    return KSHumanCreateWithParameters(kKSHumanGenderUndefiened, NULL, 1);
}

KSHuman *KSHumanCreateWithParameters(KSHumanGenderType gender, KSString *name, uint8_t age) {
    KSHuman *person = KSObjectCreateOfType(KSHuman);
    KSArray *array = KSArrayCreate();
    
    KSHumanSetKid(person, array);
    KSHumanSetGender(person,gender);
    KSHumanSetName(person, name);
    KSHumanSetAge(person, age);
    
    KSObjectRelease(array);
    
    return person;
}

KSHuman *KSHumanCreateKidWithParameters(KSHumanGenderType gender, KSHuman *mother, KSHuman *father, KSString *name) {
    KSHuman *person = KSHumanCreateWithParameters(gender, name, kKSPrimaryAge);
    
    if (kKSHumanGenderFemale == KSHumanGender(mother)
        && kKSHumanGenderMale == KSHumanGender(father)
        && KSHumanPartner(mother) == father
        && KSHumanPartner(father) == mother)
    {
        KSHumanSetMother(person, mother);
        KSHumanSetFather(person, father);
    }
    
    return person;
}

#pragma mark -
#pragma mark Accessors

KSString *KSHumanName(KSHuman *object) {
    return KSObjectGetter(object, _name, NULL);
}

void KSHumanSetName(KSHuman *object, KSString *name) {
    KSObjectRetainSetter(object, _name, name);
}

KSHuman *KSHumanPartner(KSHuman *object) {
    return KSObjectGetter(object, _partner, NULL);
}

void KSHumanSetPartner(KSHuman *object, KSHuman *partner) {
    if (NULL != object) {
        if (kKSHumanGenderMale == KSHumanGender(object)) {
            KSObjectRetainSetter(object, _partner, partner);
        } else {
            KSObjectAssignSetter(object, _partner, partner);
        }
    }
}

KSHuman *KSHumanMother(KSHuman *object) {
    return KSObjectGetter(object, _mother, NULL);
}

void KSHumanSetMother(KSHuman *object, KSHuman *mother) {
    KSHuman *previousMother = KSHumanMother(object);
    if (NULL != object && previousMother != mother) {
        KSHumanRemoveKid(previousMother, object);
        KSHumanAddKid(mother, object);
        object->_mother = mother;
    }
}

KSHuman *KSHumanFather(KSHuman *object) {
    return KSObjectGetter(object, _father, NULL);
}

void KSHumanSetFather(KSHuman *object, KSHuman *father) {
    KSHuman *previousFather = KSHumanFather(object);
    if (NULL != object && previousFather != father) {
        KSHumanRemoveKid(previousFather, object);
        KSHumanAddKid(father, object);
        object->_father = father;
    }
}

KSArray *KSHumanKid(KSHuman *object){
    return KSObjectGetter(object, _kids, NULL);
}

void KSHumanSetKid(KSHuman *object, KSArray *array){
    KSObjectRetainSetter(object, _kids, array);
}

KSHumanGenderType KSHumanGender(KSHuman *object) {
    return KSObjectGetter(object, _gender, 0);
}

void KSHumanSetGender(KSHuman *object, KSHumanGenderType gender) {
    KSObjectAssignSetter(object, _gender, gender);
}

uint8_t KSHumanKidsCount(KSHuman *object) {
    return KSObjectGetter(object, _kidsCount, 0);
}

uint8_t KSHumanAge(KSHuman *object) {
    return KSObjectGetter(object, _age, 0);
}

void KSHumanSetAge(KSHuman *object, uint8_t age) {
    KSObjectAssignSetter(object, _age, age);

}

#pragma mark -
#pragma mark Private Implementations

void KSHumanAddKid(KSHuman *parent, KSHuman *kid) {
    if (NULL == kid || NULL == parent) {
        return;
    }
    KSArrayAddObject(KSHumanKid(parent), kid);
}

void KSHumanRemoveKid(KSHuman *parent, KSHuman *kid) {
    if (NULL == kid || NULL == parent) {
        return;
    }
    KSArrayRemoveObject(KSHumanKid(parent),KSHumanKidsCount(parent));
}

void KSHumanRemoveAllKids(KSHuman *object) {
    if (NULL != object) {
        KSArray *kids = KSHumanKid(object);
        
        for (uint8_t index = 0; index < KSArrayCount(kids); index++) {
            KSHumanRemoveKid(object, KSArrayGetObjectByIndex(kids, index));
        }
    }
}
void KSHumanDivorce(KSHuman *object) {
    if (NULL != object && NULL != object->_partner) {
        if (kKSHumanGenderMale == KSHumanGender(object)) {
            KSHumanSetPartner(object->_partner, NULL);
            KSHumanSetPartner(object, NULL);
        } else {
            KSHumanSetPartner(object, NULL);
            KSHumanSetPartner(object->_partner, NULL);
        }
    }
}

void KSHumanMarry(KSHuman *object, KSHuman *partner) {
    if(NULL == object
       && object == partner
       && KSHumanGender(object) == KSHumanGender(partner)
       && KSHumanPartner(object) == partner)
    {
        return;
    }
    
    KSHumanDivorce(object); 
    KSHumanDivorce(partner);
    
    if (kKSHumanGenderMale == KSHumanGender(object)) {
        KSHumanSetPartner(partner, object);
        KSHumanSetPartner(object, partner);
    } else {
        KSHumanSetPartner(object, partner);
        KSHumanSetPartner(partner, object);
    }
}