//
//  KSArray.c
//  LerningCPart1
//
//  Created by Serg Bla on 25.10.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//
#include <stdlib.h>
#include "KSArray.h"
#include "KSObject.h"
#include "KSMacros.h"


KSArray *KSArrayCreate(void){
    return KSObjectCreateOfType(KSArray);
}


void __KSArrayDeallocate(KSArray *object){
    KSArrayRemoveAllElements(object);
    __KSObjectDeallocate(object);
}


uint8_t KSArrayCount(KSArray *object){
    uint8_t elementCount = 0;
    if (NULL != object) {
        for (uint8_t count = 0; count < kKSArrayLimit; count++) {
            if (NULL == object->_array[count]) {
                elementCount++;
            }
        }
    }
    
    return elementCount;
}

void KSArrayAddElement(KSArray *object, KSArray *element){
    if (NULL != object && NULL != element) {
        for (uint8_t index = 0; index < kKSArrayLimit; index++) {
            if (NULL == object->_array[index]) {
                object->_array[index] = element;
                KSObjectRetain(element);
                
                return;
            }
        }
    }
}

void *KSArrayGetElementByIndex(KSArray *object, uint8_t index){
    return KSObjectGetter(object, _array[index], NULL);
}

void KSArrayAddElementByIndex(KSArray *object, KSArray *element, uint8_t index){
    if (NULL != object && NULL != element) {
        object->_array[index] = element;
        
        return;
    }
}

void KSArrayRemoveElement(KSArray *object, uint8_t index){
    if (NULL != object ) {
        KSObjectRelease(object->_array[index]);
        object->_array[index] = NULL;
        
        for (uint8_t index; index < kKSArrayLimit - 1; index++) {
            object->_array[index] = object->_array[index + 1];
        }
    }
}


void KSArrayRemoveAllElements(KSArray *object){
    if (NULL != object) {
        for (uint8_t index = 0; index < kKSArrayLimit; index++) {
            if (NULL != KSArrayGetElementByIndex(object, index)) {
                KSArrayRemoveElement(object, index);
            }
        }
    }
}