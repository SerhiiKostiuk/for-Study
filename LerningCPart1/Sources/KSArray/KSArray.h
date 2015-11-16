//
//  KSArray.h
//  LerningCPart1
//
//  Created by Serg Bla on 25.10.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#ifndef KSArray_h
#define KSArray_h

#include <stdio.h>
#include "KSObject.h"

static const uint8_t kKSArrayLimit = 5;

typedef struct {
    KSObject _super;
    void *_array[kKSArrayLimit];
} KSArray;

extern
void __KSArrayDeallocate(KSArray *object);

extern
KSArray *KSArrayCreate(void);

extern
uint8_t KSArrayCount(KSArray *object);

extern
void KSArrayAddObject(KSArray *object, void *element);

extern
void *KSArrayGetObjectByIndex(KSArray *object, uint8_t index);

extern
uint8_t KSArrayIndexOfObject(KSArray *object, void *element);

extern
void KSArrayRemoveObjectByIndex(KSArray *object, uint8_t index);

extern
void KSArrayRemoveObject(KSArray *object, uint8_t index);

#endif /* KSArray_h */