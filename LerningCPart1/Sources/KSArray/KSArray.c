//
//  KSArray.c
//  LerningCPart1
//
//  Created by Serg Bla on 25.10.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//
#include <stdlib.h>
#include <assert.h>
#include "KSArray.h"
#include "KSObject.h"
#include "KSMacros.h"

#pragma mark -
#pragma mark Private Declarations

static
void KSArrayAddObjectByIndex(KSArray *object, KSArray *element, uint8_t index);

static
void KSArrayRemoveAllObjects(KSArray *object);


#pragma mark -
#pragma mark Initializations & Dealocation

void __KSArrayDeallocate(KSArray *object) {
    KSArrayRemoveAllObjects(object);
    __KSObjectDeallocate(object);
}

KSArray *KSArrayCreate(void) {
    return KSObjectCreateOfType(KSArray);
}

#pragma mark -
#pragma mark Accessors

uint8_t KSArrayCount(KSArray *object) {
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

void KSArrayAddObject(KSArray *object, void *element) {
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

void *KSArrayGetObjectByIndex(KSArray *object, uint8_t index) {
    return KSObjectGetter(object, _array[index], NULL);
}

void KSArrayAddObjectByIndex(KSArray *object, KSArray *element, uint8_t index) {
    if (NULL != object && NULL != element) {
        assert(index > KSArrayCount(object));
        object->_array[index] = element;
        
        return;
    }
}

uint8_t KSArrayIndexOfObject(KSArray *object, void *element) {
    uint8_t result = object ? kKSArrayLimit : 0;
    
    if (NULL != object && NULL != element){
        for (uint8_t index = 0; index < KSArrayCount(object); index++) {
            if (element == KSArrayGetObjectByIndex(object, index)) {
                result = index;
                
                break;
            }
        }
    }
    return result;
}

void KSArrayRemoveObject(KSArray *object, uint8_t index) {
    if (NULL != object ) {
        KSObjectRelease(object->_array[index]);
        object->_array[index] = NULL;
        
        for (uint8_t index; index < kKSArrayLimit - 1; index++) {
            object->_array[index] = object->_array[index + 1];
        }
    }
}

void KSArrayRemoveObjectByIndex(KSArray *object, uint8_t index) {
    if (NULL != object) {
        if (index < kKSArrayLimit) {
            KSArrayAddObjectByIndex(object, NULL, index);
            for (uint8_t index = 0 ; index < kKSArrayLimit - 1; index++) {
                object->_array[index] = object->_array[index + 1];
            }
        }
    }
}

void KSArrayRemoveAllObjects(KSArray *object) {
    if (NULL != object) {
        for (uint8_t index = 0; index < kKSArrayLimit; index++) {
            if (NULL != KSArrayGetObjectByIndex(object, index)) {
                KSArrayRemoveObject(object, index);
            }
        }
    }
}