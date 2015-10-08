//
//  KSObjectStructureHuman.c
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

const uint8_t kKSKidsLimit =20;

struct KSHuman {
    uint64_t _referenceCount;
    char *_name;
    KSHuman *_partner;
    KSHuman *_mother;
    KSHuman *_father;
    KSHuman *_kids[kKSKidsLimit];
    uint8_t _kidsCount;
    uint8_t _age;
    KSHumanGenderType _gender;
    bool _isMarried;
};


void KSObjectRetain (KSHuman *KSObject){
    if (KSObject) {
        KSObject->_referenceCount++;
    }
}

void KSObjectRealese (KSHuman *KSObject){
    if (NULL != KSObject) {
        if (0 == --(KSObject->_referenceCount)) {
            _KSHumanDeallocate(KSObject);
        }
    }
}
#pragma mark -
#pragma mark Private Implementations


KSHuman *KSHumanCreate(void){
    KSHuman *KSObject = calloc(1,sizeof(KSHuman));
    assert(KSObject != NULL);
    return KSObject;
}

void _KSHumanDeallocate(KSHuman *KSObject){
    KSHumanSetName(KSObject,NULL);
    KSHumanSetPartner(KSObject,NULL);
    KSHumanSetMother(KSObject,NULL);
    KSHumanSetFather(KSObject,NULL);
   // KSHumanSetKids (KSObject,NULL);
    
    free(KSObject);
}

char *KSHumanName(KSHuman *KSObject){
    KSReturnObjectFieldOrValue(KSObject,_name,NULL);
}

void KSHumanSetName (KSHuman *KSObject, char *_name){
    if (NULL != KSObject) {
        if (NULL != KSObject->_name) {
            free(KSObject->_name);
            KSObject->_name = NULL;
        }
        if (_name) {
            KSObject->_name = strdup(_name);
        }
    }
}

KSHuman *KSHumanPartner (KSHuman *KSObject){
    KSReturnObjectFieldOrValue(KSObject, _partner, NULL);
}

void KSHumanSetPartner (KSHuman *KSObject, KSHuman *_partner){
    if (NULL != KSObject && KSObject->_partner != _partner) {
        KSObjectRealese(KSObject->_partner);
        
    KSObject->_partner = _partner;
    KSObjectRetain(_partner);
}
}

KSHuman *KSHumanMother (KSHuman *KSObject){
    KSReturnObjectFieldOrValue(KSObject, _mother, NULL);
}

void KSHumanSetMother (KSHuman *KSObject, KSHuman *_mother){
    if (NULL != KSObject && KSObject->_mother != _mother) {
        KSObjectRealese(KSObject->_mother);
        
      KSObject->_mother = _mother;
        KSObjectRetain(_mother);
    }
    
}

KSHuman *KSHumanFather (KSHuman *KSObject){
    KSReturnObjectFieldOrValue(KSObject, _father, NULL);
}

void KSHumanSetFather (KSHuman *KSObject, KSHuman *_father){
    if (NULL != KSObject && KSObject->_father != _father) {
        KSObjectRealese(KSObject->_father);
        
        KSObject->_father = _father;
        KSObjectRetain(_father);
    }
   
}

KSHumanGenderType KSHumanGender (KSHuman *KSObject){
    KSReturnObjectFieldOrValue(KSObject, _gender, KSHumanGenderUndefiened);
}

void KSHumanSetGender (KSHuman *KSObject, KSHumanGenderType gender){
    if (NULL != KSObject) {
        KSObject->_gender = gender;
    }
}

KSHuman *KSHumanKids (KSHuman *KSObject){
    return *(NULL != KSObject ? KSObject->_kids : NULL);
}


uint8_t KSHumanKidsCount (KSHuman *KSObject){
    KSReturnObjectFieldOrValue(KSObject, _kidsCount, 0);
}

bool KSHumanIsMarried (KSHuman *KSObject){
    return NULL != KSObject && NULL != KSObject->_partner;
}

//void KSHumanSetMarry (KSHuman *KSObject, KSHuman *_partner){
//    if (NULL != KSObject && NULL != _partner){
//        KSHumanSetDivorce(KSObject, _partner);
//    
//        KSHumanSetPartner(KSObject, _partner);
//        KSHumanSetPartner(_partner, KSObject);
//    }
//}
//
//void KSHumanSetDivorce (KSHuman *KSObject, KSHuman *_partner){
//    
//}