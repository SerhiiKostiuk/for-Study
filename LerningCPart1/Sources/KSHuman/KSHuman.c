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



#pragma mark -
#pragma mark Initializations & Dealocation

void __KSHumanDeallocate(void *object) {
    KSHumanSetName(object, NULL);
    KSHumanRemoveKid(object, NULL);
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
    return KSObjectGetter(object, _name, NULL);
}

void KSHumanSetName(KSHuman *object, KSString *name) {
    KSObjectRetainSetter(object, _name, name);
}

KSHuman *KSHumanPartner(KSHuman *object) {
    return KSObjectGetter(object, _partner, NULL);
}

void KSHumanSetPartner(KSHuman *object, KSHuman *partner) {
    if (NULL != object && object->_partner != partner) {
        
        
        KSHuman *headman = NULL;
//        KSHuman *female = headman == object ? partner : object;
        
        if (kKSHumanGenderMale == KSHumanGender(object)) {
            headman = object;
        } else if(kKSHumanGenderMale != KSHumanGender(object)){
            headman = partner;
            
        }
        
        
        KSObjectRelease(object->_partner);
        object->_partner = partner;
        KSObjectRetain(partner);
        
    }
}

KSHuman *KSHumanMother(KSHuman *object) {
    return KSObjectGetter(object, _mother, NULL);
}

void KSHumanSetMother(KSHuman *object, KSHuman *mother) {
    KSObjectAssignSetter(object, _mother, mother);

}

KSHuman *KSHumanFather(KSHuman *object) {
    return KSObjectGetter(object, _father, NULL);
}

void KSHumanSetFather(KSHuman *object, KSHuman *father) {
    KSObjectAssignSetter(object, _father, father);
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

void KSHumanDivorce(KSHuman *object) {
    if (NULL != object && NULL != object->_partner) {
        KSHumanSetPartner(object, NULL);
        KSHumanSetPartner(object->_partner, NULL);
    }
}

void KSHumanMarry(KSHuman *object, KSHuman *partner) {
    if(NULL == object && KSHumanGender(object) == KSHumanGender(partner)){
        return;
    }
    
    if (NULL != object) {
        KSHumanDivorce(object);
        KSHumanDivorce(partner);
    }
    
// kKSHumanGenderMale == KSHumanGender(object) ? KSHumanSetPartner(object, partner) : KSHumanSetPartner(partner, object);
    KSHumanSetPartner(object, partner);
    KSHumanSetPartner(partner, object);
}

#pragma mark -
#pragma mark Private Implementations

void KSHumanAddKid(KSHuman *parent, KSHuman *kid) {
    if (NULL == kid || NULL == parent) {
        return;
    }
    
    kKSHumanGenderFemale == KSHumanGender(parent) ? KSHumanSetMother(kid, parent) : KSHumanSetFather(kid, parent);
    KSArrayAddElement(KSHumanKid(parent), kid);
    
//    for (uint8_t childIndex = 0; childIndex < kKSKidsLimit; childIndex++) {
//        if(NULL == parent->_kids[childIndex]){
//            parent->_kids[childIndex] = kid;
//            KSObjectRetain(kid);
//            parent->_kidsCount++;
//            
//            return;
//        }
//    }
    
}

void KSHumanRemoveKid(KSHuman *parent, KSHuman *kid) {
    if (NULL == kid || NULL == parent) {
        return;
    }
    
    KSArrayRemoveElement(KSHumanKid(parent),KSHumanKidsCount(parent));
    kKSHumanGenderFemale == KSHumanGender(parent) ? KSHumanSetMother(kid, NULL) : KSHumanSetFather(kid, NULL);
    
//    for (uint8_t childIndex = 0; childIndex < kKSKidsLimit; childIndex++) {
//        KSHuman *child = parent->_kids[childIndex];
//        if (kid == child) {
    
//            parent->_kids[childIndex] = NULL;
//            KSObjectRelease(child);
//            parent->_kidsCount--;
//            
//            for (uint8_t index = childIndex; index < kKSKidsLimit - 1; index++) {
//                parent->_kids[index] = parent->_kids[index + 1];
//            }
//        }
//        parent->_kids[kKSKidsLimit - 1] = NULL;
//    }
}
