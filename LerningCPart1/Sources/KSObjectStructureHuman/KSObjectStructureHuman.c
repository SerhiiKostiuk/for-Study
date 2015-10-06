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
#include "KSObjectStructureHuman.h"

#define KSReturnObjectFieldOrValue(object, fieldName, nullValue)\
return NULL != object ? object->fieldName : nullValue

#pragma mark -
#pragma mark Private Declarations


#pragma mark -
#pragma mark Private Implementations


KSHuman *KSHumanCreate(void){
    KSHuman *KSObject = malloc(sizeof(KSHuman));
    assert(KSObject !=NULL);
    return KSObject;
}

char *KSHumanName(KSHuman *KSObject){
    KSReturnObjectFieldOrValue(KSObject,_name,NULL);
}

void KSHumanSetName (KSHuman *KSObject, char *_name){
    KSObject->_name = _name;
}

char *KSHumanPointerOnPartner (KSHuman *KSObject){
    KSReturnObjectFieldOrValue(KSObject, _pointerOnPartner, NULL);
}

void KSHumanSetPointerOnPartner (KSHuman *KSObject, char *_pointerOnPartner){
    KSObject->_pointerOnPartner = _pointerOnPartner;
}

char *KSHumanPointerOnMother (KSHuman *KSObject){
    KSReturnObjectFieldOrValue(KSObject, _pointerOnMother, NULL);
}

void KSHumanSetPointerOnMother (KSHuman *KSObject, char *_pointerOnMother){
    KSObject->_pointerOnMother = _pointerOnMother;
}

char *KSHumanPointerOnFather (KSHuman *KSObject){
    KSReturnObjectFieldOrValue(KSObject, _pointerOnFather, NULL);
}

void KSSetPointerOnFather (KSHuman *KSObject, char *_pointerOnFather){
    KSObject->_pointerOnFather = _pointerOnFather;
}




