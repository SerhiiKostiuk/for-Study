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

#pragma mark -
#pragma mark Private Declarations

void KSObjectRetain (KSHuman *object){
    if (object) {
        object->_referenceCount++;
    }
}

void KSObjectRealese (KSHuman *object){
    if (NULL != object) {
        if (0 == --(object->_referenceCount)) {
            _KSHumanDeallocate(object);
        }
    }
}
#pragma mark -
#pragma mark Private Implementations

KSHuman *KSHumanCreate(void){
    KSHuman *person = calloc(1,sizeof(KSHuman));
    assert(NULL != person);
    
    KSHumanSetGender(person, KSHumanGenderUndefiened);
    KSHumanSetAge(person, 1);
    
    return person;
}

KSHuman *KSHumanCreateByDefault(KSHumanGenderType gender, char *name, uint8_t age){
    KSHuman *person = calloc(1,sizeof(KSHuman));
    assert(person != NULL);
    
    KSHumanSetGender(person,gender);
    KSHumanSetName(person, name);
    KSHumanSetAge(person, age);
    
    return person;
}

void _KSHumanDeallocate(KSHuman *object){
    KSHumanSetName(object,NULL);
    KSHumanSetPartner(object,NULL);
    KSHumanSetMother(object,NULL);
    KSHumanSetFather(object,NULL);
    
    free(object);
}

char *KSHumanName(KSHuman *object){
    KSReturnObjectFieldOrValue(object,_name,NULL);
}

void KSHumanSetName (KSHuman *object, char *name){
    if (NULL != object) {
        if (NULL != object->_name) {
            free(object->_name);
            object->_name = NULL;
        }
        if (name) {
            object->_name = strdup(name);
        }
    }
}

KSHuman *KSHumanPartner (KSHuman *object){
    KSReturnObjectFieldOrValue(object, _partner, NULL);
}

void KSHumanSetPartner (KSHuman *object, KSHuman *partner){
    if (NULL != object && object->_partner != partner) {
        KSObjectRealese(object->_partner);
        object->_partner = partner;
        KSObjectRetain(partner);
    }
}

KSHuman *KSHumanMother (KSHuman *object){
    KSReturnObjectFieldOrValue(object, _mother, NULL);
}

void KSHumanSetMother (KSHuman *object, KSHuman *mother){
    if (NULL != object && object->_mother != mother) {
        KSObjectRealese(object->_mother);
        object->_mother = mother;
        KSObjectRetain(mother);
    }
}

KSHuman *KSHumanFather (KSHuman *object){
    KSReturnObjectFieldOrValue(object, _father, NULL);
}

void KSHumanSetFather (KSHuman *object, KSHuman *father){
    if (NULL != object && object->_father != father) {
        KSObjectRealese(object->_father);
        object->_father = father;
        KSObjectRetain(father);
    }
}

KSHumanGenderType KSHumanGender (KSHuman *object){
    KSReturnObjectFieldOrValue(object, _gender, KSHumanGenderUndefiened);
}

void KSHumanSetGender (KSHuman *object, KSHumanGenderType gender){
    if (NULL != object) {
        object->_gender = gender;
    }
}

//KSHuman **KSHumanKids (KSHuman *object){
//    return NULL != object ? object->_kids : NULL;
//}

uint8_t KSHumanKidsCount (KSHuman *object){
    KSReturnObjectFieldOrValue(object, _kidsCount, 0);
}

uint8_t KSHumanAge (KSHuman *object){
    KSReturnObjectFieldOrValue(object, _age, 0);
}

void KSHumanSetAge (KSHuman *object, uint8_t age){
    if (NULL != object) {
        object->_age = age;
    }
}

void KSHumanSetDivorce (KSHuman *object, KSHuman *partner){
    if (NULL != object && NULL != object->_partner) {
        KSObjectRealese(object->_partner);
    }
}

void KSHumanSetMarry (KSHuman *object, KSHuman *partner){
    if (NULL != object && NULL != object->_partner){
        KSHumanSetDivorce(object, partner);
    }
    KSHumanSetPartner(object, partner);
}
