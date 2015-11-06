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
    void **_objects;
    uint64_t _count;
    uint64_t _allocatedCount;
    
} KSDynamicArray;

extern
void __KSDynamicArrayDeallocate(KSDynamicArray *array);

extern
KSDynamicArray *KSDynamicArrayCreate(void);

extern
uint64_t KSDynamicArrayCount(KSDynamicArray *array);

extern
uint64_t KSDynamicArrayAllocatedCount(KSDynamicArray *array);

extern
void *KSDynamicArrayGetObjectByIndex(KSDynamicArray *array, uint64_t index);

extern
bool KSDynamicArrayIncludesObject(KSDynamicArray *array, void *object);

extern
uint64_t KSDynamicArrayIndexOfObject(KSDynamicArray *array, void *object);

extern
void KSDynamicArrayAddObject(KSDynamicArray *array, void *object);

extern
void KSDynamicArrayRemoveObject(KSDynamicArray *array, void *object);


extern
void KSDynamicArrayRemoveObjectByIndex(KSDynamicArray *array, uint64_t index);






#endif /* KSDynamicArray_h */
