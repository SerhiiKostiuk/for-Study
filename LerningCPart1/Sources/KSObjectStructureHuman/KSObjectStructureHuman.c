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

#define KSCheckNULLValue(object, fieldName, nameOfVariable)\
        if (NULL != object && object->fieldName != nameOfVariable) { \
            KSObjectRelease(object->fieldName);\
            object->fieldName = nameOfVariable;\
            KSObjectRetain(nameOfVariable);\
        }

#pragma mark -
#pragma mark Private Declarations
static
void KSObjectRetain(KSHuman *object);

static
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
    KSCheckNULLValue(object,_partner, partner);
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
    KSCheckNULLValue(object,_mother, mother);
}

KSHuman *KSHumanFather(KSHuman *object){
    KSReturnObjectFieldOrValue(object, _father, NULL);
}

void KSHumanSetFather(KSHuman *object, KSHuman *father){
     KSCheckNULLValue(object,_father, father);
}

KSHumanGenderType KSHumanGender(KSHuman *object){
    KSReturnObjectFieldOrValue(object, _gender, KSHumanGenderUndefiened);
}

void KSHumanSetGender(KSHuman *object, KSHumanGenderType gender){
    if (NULL != object) {
        object->_gender = gender;
    }
}

//KSHuman **KSHumanKids (KSHuman *object){
//    return NULL != object ? object->_kids : NULL;
//}

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
    assert(object->_partner == object->_partner);
    
    if (NULL != object && NULL != object->_partner){
        KSHumanSetDivorce(object);
    }
    KSHumanSetPartner(partner, object);
    KSHumanUnsignedSetPartner(partner, object);
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
    
    return person;
}

KSHuman *KSHumanCreateKidWithParameters(KSHumanGenderType gender, KSHuman *mother, KSHuman *father, char *name){
    KSHuman *person = calloc(1,sizeof(KSHuman));
    assert(person != NULL);
    
    KSHumanSetGender(person, gender);
    KSHumanSetMother(person, mother);
    KSHumanSetFather(person, father);
    KSHumanSetName(person, name);
    
    return person;
  
}

void _KSHumanDeallocate(KSHuman *object){
    KSHumanSetName(object, NULL);
    KSHumanSetPartner(object, NULL);
    KSHumanUnsignedSetPartner(object, NULL);
    KSHumanSetMother(object, NULL);
    KSHumanSetFather(object, NULL);
    KSHumanSetDivorce(object);
   
    
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

