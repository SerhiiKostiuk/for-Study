//
//  KSDynamicArray.c
//  LerningCPart1
//
//  Created by Serg Bla on 30.10.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#include <stdlib.h>
#include <assert.h>
#include <string.h>
#include <stdbool.h>
#include "KSDynamicArray.h"

const uint64_t kKSCanNotFindObject = UINT64_MAX;

#pragma mark -
#pragma mark Private Declarations

static
void **KSDynamicArrayObjects(KSDynamicArray *array);

static
void KSDynamicArraySetObjects(KSDynamicArray *array, void *object);

static
void KSDynamicArraySetCount(KSDynamicArray *array, uint64_t count);

static
void KSDynamicArraySetAllocatedCount(KSDynamicArray *array, uint64_t allocatedCount);

static
void KSDynamicArraySetObjectByIndex(KSDynamicArray *array, void *object, uint64_t index);

static
void KSDynamicArrayRemoveAllObjects(KSDynamicArray *array);

static
uint64_t KSDynamicArrayProposedAllocatedCount(KSDynamicArray * array, uint64_t newCount);

static
bool KSDynamicArrayShouldResize( KSDynamicArray *array, uint64_t newCount);

static
void KSDynamicArrayResizeIfNeeded(KSDynamicArray *array, uint64_t newCount);



#pragma mark -
#pragma mark Initializations & Dealocation

void __KSDynamicArrayDeallocate(KSDynamicArray *array) {
    KSDynamicArrayRemoveAllObjects(array);
    
    __KSObjectDeallocate(array);
}

KSDynamicArray *KSDynamicArrayCreate(void) {
    return KSObjectCreateOfType(KSDynamicArray);
}

#pragma mark -
#pragma mark Accessors

void **KSDynamicArrayObjects(KSDynamicArray *array) {
   return KSObjectGetter(array, _objects, NULL);
}

void KSDynamicArraySetObjects(KSDynamicArray *array, void *object) {
    KSObjectAssignSetter(array, _objects, object);
}

uint64_t KSDynamicArrayCount(KSDynamicArray *array) {
    return KSObjectGetter(array, _count, 0);
}

void KSDynamicArraySetCount(KSDynamicArray *array, uint64_t count) {
    KSDynamicArrayResizeIfNeeded(array, count);
    KSObjectAssignSetter(array, _count, count);
}

uint64_t KSDynamicArrayAllocatedCount(KSDynamicArray *array) {
       return KSObjectGetter(array, _allocatedCount, 0);
}

void KSDynamicArraySetAllocatedCount(KSDynamicArray *array, uint64_t allocatedCount) {
    if (NULL == array) {
        return;
    }
    void **elements = KSDynamicArrayObjects(array);
    uint64_t count = KSDynamicArrayAllocatedCount(array);
    
    if (0 == allocatedCount && NULL != elements) {
        free(elements);
        KSDynamicArraySetObjects(array, NULL);
    } else {
        size_t objectSize = sizeof(*elements);
        size_t allocatedSize = allocatedCount * objectSize;
        size_t size = count * objectSize;
        
        void *newElement = realloc(elements, allocatedSize);
        assert(newElement);
        KSDynamicArraySetObjects(array, newElement);
        
        if (allocatedCount > count) {
            memset(elements + size, 0, allocatedSize - size);
        }
    }
    array->_allocatedCount = allocatedCount;
}

void *KSDynamicArrayGetObjectByIndex(KSDynamicArray *array, uint64_t index) {
    if (NULL != array && index < KSDynamicArrayAllocatedCount(array)) {
        return array->_objects[index];
    }
    
    return NULL;
}

void KSDynamicArraySetObjectByIndex(KSDynamicArray *array, void *object, uint64_t index) {
    if (NULL != array) {
        assert(index < KSDynamicArrayCount(array));
    }
    KSObjectRetainSetter(array, _objects[index], object);
   
}

#pragma mark -
#pragma mark Public Implementations

uint64_t KSDynamicArrayIndexOfObject(KSDynamicArray *array, void *object){
    uint64_t result = array ? kKSCanNotFindObject : 0;
    
    if (NULL != array && NULL != object) {
        for (uint64_t index = 0; index < KSDynamicArrayCount(array); index++) {
            if (KSDynamicArrayGetObjectByIndex(array, index) == object) {
                result = index;
                
                break;
            }
        }
    }
    
    return result;
}

bool KSDynamicArrayIncludesObject(KSDynamicArray *array, void *object){
    return NULL != array && NULL != object && kKSCanNotFindObject != KSDynamicArrayIndexOfObject(array, object);
}

void KSDynamicArrayAddObject(KSDynamicArray *array, void *object){
    if (NULL != array && NULL != object) {
        uint64_t count = KSDynamicArrayCount(array);
        
        KSDynamicArraySetCount(array, count + 1);
        KSDynamicArraySetObjectByIndex(array, object, count);
    }
}

void KSDynamicArrayRemoveObject(KSDynamicArray *array, void *object){
    if (KSDynamicArrayIncludesObject(array, object)) {
        KSDynamicArrayRemoveObjectByIndex(array, KSDynamicArrayIndexOfObject(array, object));
    }
}


void KSDynamicArrayRemoveObjectByIndex(KSDynamicArray *array, uint64_t index) {
    if (NULL != array) {
        uint64_t count = KSDynamicArrayCount(array);
        
        if (index < count) {
            KSDynamicArraySetObjectByIndex(array, NULL, index);
            
            void **object = KSDynamicArrayObjects(array);
            
            size_t memSize = (count - index) * sizeof(object);
            
            memmove(&object[index], &object[index], memSize);
            
            object[count - 1] = NULL;
            
            KSDynamicArraySetCount(array, count - 1);
        }
    }
}

#pragma mark -
#pragma mark Private Implementations

void KSDynamicArrayRemoveAllObjects(KSDynamicArray *array){
    if (NULL != array) {
        for (uint64_t index = 0; index < KSDynamicArrayCount(array); index++) {
            KSDynamicArrayRemoveObjectByIndex(array, index);
        }
    }
}

uint64_t KSDynamicArrayProposedAllocatedCount(KSDynamicArray * array, uint64_t newCount) {
    uint64_t proposedAllocatedCount = 0;
    
    if (NULL != array) {
        uint64_t currentCount = KSDynamicArrayCount(array);
        uint64_t currentAllocatedCount = KSDynamicArrayAllocatedCount(array);
        
        if (newCount > currentCount) {
            if (newCount >= currentAllocatedCount) {
                proposedAllocatedCount = newCount * 4 / 3 + 2;
            } else {
                proposedAllocatedCount = currentAllocatedCount;
            }
        } else {
            uint64_t inequalityAllocatedCount = (currentAllocatedCount * 4 / 3 + 2) - currentAllocatedCount;
            
            if (newCount <= currentAllocatedCount - inequalityAllocatedCount) {
                proposedAllocatedCount = currentAllocatedCount - inequalityAllocatedCount;
            } else {
                proposedAllocatedCount = currentAllocatedCount;
            }
        }
    }
    
    return proposedAllocatedCount;
}

bool KSDynamicArrayShouldResize( KSDynamicArray *array, uint64_t newCount){
    return NULL != array && KSDynamicArrayAllocatedCount(array) != KSDynamicArrayProposedAllocatedCount(array, newCount);
}

void KSDynamicArrayResizeIfNeeded(KSDynamicArray *array, uint64_t newCount){
    if (NULL != array && true == KSDynamicArrayShouldResize(array, newCount)) {
        KSDynamicArraySetAllocatedCount(array, KSDynamicArrayProposedAllocatedCount(array, newCount));
    }
}



