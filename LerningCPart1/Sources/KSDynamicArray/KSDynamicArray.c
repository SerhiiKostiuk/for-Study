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

#pragma mark -
#pragma mark Private Declarations

static
void KSDynamicArraySetAllocatedCount(KSDynamicArray *array, uint64_t allocatedCount);

static
void KSDynamicArraySetCount(KSDynamicArray *array, uint64_t count);

#pragma mark -
#pragma mark Initializations & Dealocation

void __KSDynamicArrayDeallocate(KSDynamicArray *array) {
    for (uint64_t index = 0; index < KSDynamicArrayCount(array); index++) {
        KSDynamicArraySetObjectByIndex(array, NULL, index);
    }
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
    KSObjectAssignSetter(array, _count, count);
}

uint64_t KSDynamicArrayAllocatedCount(KSDynamicArray *array) {
       return KSObjectGetter(array, _allocatedCount, 0);
}

void KSDynamicArraySetAllocatedCount(KSDynamicArray *array, uint64_t allocatedCount) {
    if (NULL == array) {
        return;
    }
    uint64_t count = array->_count;
    if (UINT64_MAX == allocatedCount && count == allocatedCount) {
        return;
    }
    void **elements = array->_objects;
    
    if (allocatedCount <= count) {
        for (uint64_t offset = allocatedCount -1 ; offset < count; offset++) {
            KSDynamicArraySetObjectByIndex(array, NULL, offset);
        }
    }
    
    if (0 == allocatedCount) {
        free(elements);
        array->_objects = NULL;
    } else {
        size_t objectSize = sizeof(*elements);
        size_t allocatedSize = allocatedCount * objectSize;
        size_t size = count * objectSize;
        
        void *newElement = realloc(elements, allocatedSize);
        assert(newElement);
        array->_objects = newElement;
        
        if (allocatedCount > count) {
            memset(array->_objects + size, 0, allocatedSize - size);
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
    if (index < KSDynamicArrayAllocatedCount(array)) {
        KSObjectRelease(array->_objects[index]);
        array->_objects[index] = object;
        KSObjectRetain(object);
    }
}

void KSDynamicArrayAddObject(KSDynamicArray *array, void *object);


void KSDynamicArrayRemoveObject(KSDynamicArray *array, void *object);


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


void KSDynamicArrayRemoveAllElements(KSDynamicArray *array);


#pragma mark -
#pragma mark Private Implementations

uint64_t KSDynamicArrayProposedAllocatedCount (KSDynamicArray * array, uint64_t count) {
    return UINT64_MAX / 2;
}

//bool KSDynamicArrayShouldResize( KSDynamicArray *object){
//  //  return object && KSDynamicArrayAllocatedCount(object) != KSDynamicArrayProposedAllocatedCount(object);
//
//}




