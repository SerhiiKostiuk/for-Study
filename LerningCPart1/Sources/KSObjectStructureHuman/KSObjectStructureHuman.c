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
        return NULL != object ? object->fieldName : nullValue

#define KSRetainAndReleaseSetter(object, fieldName, nameOfVariable)\
        if (NULL != object && object->fieldName != nameOfVariable) { \
            KSObjectRelease(object->fieldName);\
            object->fieldName = nameOfVariable;\
            KSObjectRetain(nameOfVariable);\
        }

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
uint8_t KSHumanAddKid(KSHuman *parent, KSHuman *object);

static
void KSHumanRemoveKid(KSHuman *object);

#pragma mark -
#pragma mark Accessors

char *KSHumanName(KSHuman *object){
    KSReturnObjectFieldOrValue(object,_name,NULL);
}

void KSHumanSetName(KSHuman *object, char *name){
    if (NULL != object) {
        if (NULL != KSHumanName(object)){
            free (KSHumanName(object));
            object->_name = NULL;
        }
        if (name) {
            object->_name = strdup(name);
        }
    }
}

KSHuman *KSHumanPartner(KSHuman *object){
    KSReturnObjectFieldOrValue(object, _partner, NULL);
}

void KSHumanSetPartner(KSHuman *object, KSHuman *partner){
    KSRetainAndReleaseSetter(object,_partner, partner);
}

void KSHumanUnsignedSetPartner(KSHuman *object, KSHuman *partner){
    if (NULL != object && object->_partner != partner) {
        object->_partner = partner;
       
    }
}

KSHuman *KSHumanMother(KSHuman *object){
    KSReturnObjectFieldOrValue(object, _mother, NULL);
}

void KSHumanSetMother(KSHuman *object, KSHuman *mother){
    KSRetainAndReleaseSetter(object,_mother, mother);
}

KSHuman *KSHumanFather(KSHuman *object){
    KSReturnObjectFieldOrValue(object, _father, NULL);
}

void KSHumanSetFather(KSHuman *object, KSHuman *father){
     KSRetainAndReleaseSetter(object,_father, father);
}

KSHumanGenderType KSHumanGender(KSHuman *object){
    KSReturnObjectFieldOrValue(object, _gender, 0);
}

void KSHumanSetGender(KSHuman *object, KSHumanGenderType gender){
    if (NULL != object) {
        object->_gender = gender;
    }
}

uint8_t KSHumanAddKid(KSHuman *parent, KSHuman *object){
    uint8_t result;
    if (object != NULL) {
        KSHumanGenderFemale == KSHumanGender(parent)
                               ? KSHumanSetMother(object, parent)
                               : KSHumanGenderMale == KSHumanGender(parent)
                               ? KSHumanSetFather(object, parent)
                               : NULL;
    }
    
    for (uint8_t childIndex = 0; childIndex < kKSKidsLimit; childIndex++) {
        if(NULL == parent->_kids[childIndex]){
            parent->_kids[childIndex] = object;
            KSObjectRetain(object);
            parent->_kidsCount++;
            
            return result;
        }
        
    }
    return 0;
}

void KSHumanRemoveKid(KSHuman *object){
    if (NULL != object) {
        KSHumanGenderFemale == KSHumanGender(object)
        ? KSHumanSetMother(object, NULL)
        : KSHumanGenderMale == KSHumanGender(object)
        ? KSHumanSetFather(object, NULL)
        : NULL;
    }
    KSObjectRelease(object);    
    object->_kidsCount--;
    object = NULL;
}

uint8_t KSHumanKidsCount(KSHuman *object){
    KSReturnObjectFieldOrValue(object, _kidsCount, 0);
}

uint8_t KSHumanAge(KSHuman *object){
    KSReturnObjectFieldOrValue(object, _age, 0);
}

void KSHumanSetAge(KSHuman *object, uint8_t age){
    if (NULL != object) {
        object->_age = age;
    }
}

void KSHumanSetDivorce(KSHuman *object){
    if (NULL != object && NULL != object->_partner) {
        KSHumanSetPartner(object, NULL);
    }
}

void KSHumanSetMarry(KSHuman *object, KSHuman *partner){
    assert(object->_partner == object->_partner && KSHumanGender(object) != KSHumanGender(partner));
    
    if (NULL != object/* && NULL != object->_partner*/){
        KSHumanSetDivorce(object);
        KSHumanSetDivorce(partner);
    }
    KSHumanSetPartner(partner, object);
    KSHumanUnsignedSetPartner(object, partner);
}


#pragma mark -
#pragma mark Public Implementations

KSHuman *KSHumanCreate(void){
    return KSHumanCreateWithParameters(KSHumanGenderUndefiened, NULL, 1);
}

KSHuman *KSHumanCreateWithParameters(KSHumanGenderType gender, char *name, uint8_t age){
    KSHuman *person = calloc(1,sizeof(KSHuman));
    assert(person != NULL);
    
    KSHumanSetGender(person,gender);
    KSHumanSetName(person, name);
    KSHumanSetAge(person, age);
    person->_referenceCount = 1;
    
    return person;
}

KSHuman *KSHumanCreateKidWithParameters(KSHumanGenderType gender, KSHuman *mother, KSHuman *father, char *name){
    KSHuman *person = KSHumanCreateWithParameters(gender, name, kKSPrimaryAge);
    
    KSHumanSetMother(person, mother);
    KSHumanSetFather(person, father);
    KSHumanAddKid(mother,person);
    KSHumanAddKid(father,person);
    
    return person;
  

}
void _KSHumanDeallocate(KSHuman *object){
    KSHumanSetName(object, NULL);
    KSHumanUnsignedSetPartner(object, NULL);
    KSHumanSetMother(object, NULL);
    KSHumanSetFather(object, NULL);
    KSHumanSetDivorce(object);
    KSHumanRemoveKid(object);
    
    free(object);
}


void KSObjectRetain(KSHuman *object){
    if (object) {
        object->_referenceCount++;
    }
}

void KSObjectRelease(KSHuman *object){
    if (NULL != object) {
        if (0 == --(object->_referenceCount)) {
            _KSHumanDeallocate(object);
        }
    }
}

