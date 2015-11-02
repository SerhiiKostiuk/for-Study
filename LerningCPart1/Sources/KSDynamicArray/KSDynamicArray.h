//
//  KSDynamicArray.h
//  LerningCPart1
//
//  Created by Serg Bla on 30.10.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#ifndef KSDynamicArray_h
#define KSDynamicArray_h

#include <stdio.h>
#include "KSObject.h"

typedef struct {
    KSObject _super;
    void **_elements;
    uint64_t _count;
    uint64_t _allocatedCount;
    
} KSDynamicArray;

extern
void __KSDynamicArrayDeallocate(KSDynamicArray *object);

extern
KSDynamicArray *KSDynamicArrayCreate(void);

extern
uint64_t KSDynamicArrayCount(KSDynamicArray *object);

extern
void KSDynamicArrayAddElement(KSDynamicArray *object, void *element);

extern
void KSDynamicArrayRemoveElement(KSDynamicArray *object, void *element);

extern
void *KSDynamicArrayGetElementByIndex(KSDynamicArray *object, uint64_t index);

extern
void KSDynamicArraySetElementByIndex(KSDynamicArray *object, void *element, uint64_t index);

extern
void KSDynamicArrayRemoveElementByIndex(KSDynamicArray *object, uint64_t index);

extern
void KSDynamicArrayRemoveAllElements(KSDynamicArray *object);

extern
uint64_t KSDynamicArrayIndexOfValue(KSDynamicArray *object, void *element);

extern
uint64_t KSDynamicArrayAllocatedCount(KSDynamicArray *object);


#endif /* KSDynamicArray_h */
