//
//  KSDynamicArray.c
//  LerningCPart1
//
//  Created by Serg Bla on 30.10.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#include "KSDynamicArray.h"

#pragma mark -
#pragma mark Private Declarations

static
void KSDynamicArraySetAllocatedCount(KSDynamicArray *object, uint64_t allocatedCount);

static
void KSDynamicArraySetCount(KSDynamicArray *object, uint64_t count);

#pragma mark -
#pragma mark Initializations & Dealocation

void __KSDynamicArrayDeallocate(KSDynamicArray *object) {
    for (uint64_t index = 0; index < KSDynamicArrayCount(object); index++) {
        KSDynamicArraySetElementByIndex(object, NULL, index);
    }
}

KSDynamicArray *KSDynamicArrayCreate(void) {
    return KSObjectCreateOfType(KSDynamicArray);
}

#pragma mark -
#pragma mark Accessors

uint64_t KSDynamicArrayCount(KSDynamicArray *object) {
    return KSObjectGetter(object, _count, 0);
}

void KSDynamicArraySetCount(KSDynamicArray *object, uint64_t count) {
    KSObjectAssignSetter(object, _count, count);
}

uint64_t KSDynamicArrayAllocatedCount(KSDynamicArray *object){
   return KSObjectGetter(object, _allocatedCount, 0);
}

void KSDynamicArraySetAllocatedCount(KSDynamicArray *object, uint64_t allocatedCount) {
    KSObjectAssignSetter(object, _allocatedCount, allocatedCount);
}

void *KSDynamicArrayGetElementByIndex(KSDynamicArray *object, uint64_t index){
    if (NULL != object && index < KSDynamicArrayAllocatedCount(object)) {
        return object->_elements[index];
    }
    
    return NULL;
}

void KSDynamicArraySetElementByIndex(KSDynamicArray *object, void *element, uint64_t index) {
    if (index < KSDynamicArrayAllocatedCount(object)) {
        KSObjectRelease(object->_elements[index]);
        object->_elements[index] = element;
        KSObjectRetain(element);
    }
}

extern
void KSDynamicArrayAddElement(KSDynamicArray *object, void *element);

extern
void KSDynamicArrayRemoveElement(KSDynamicArray *object, void *element);

extern
void KSDynamicArrayRemoveElementByIndex(KSDynamicArray *object, uint64_t index);

extern
void KSDynamicArrayRemoveAllElements(KSDynamicArray *object);