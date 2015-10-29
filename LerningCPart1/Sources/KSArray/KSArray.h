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


static const uint8_t kKSArrayLimit = 20;

typedef struct {
    KSObject _super;
    void *_array[kKSArrayLimit];
} KSArray;

extern
KSArray *KSArrayCreate(void);

extern
void __KSArrayDeallocate(KSArray *object);

extern
uint8_t KSArrayCount(KSArray *object);

extern
void KSArrayAddElement(KSArray *object, KSArray *element);

extern
void *KSArrayGetElementByIndex(KSArray *object, uint8_t index);

extern
void KSArrayAddElementByIndex(KSArray *object, KSArray *element, uint8_t index);

extern
void KSArrayRemoveElement(KSArray *object, uint8_t index);

extern
void KSArrayRemoveAllElements(KSArray *object);

#endif /* KSArray_h */
