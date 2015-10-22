//
//  KSObject.h
//  LerningCPart1
//
//  Created by Serg Bla on 21.10.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#ifndef KSObject_h
#define KSObject_h

#include <stdio.h>

#define KSObjectCreateOfType(type) __KSObjectCreate(sizeof(type), __ ##type ##Deallocate) 

typedef void (*KSObjectDeallocator)(void *object);

typedef struct {
    uint64_t _retainCount;
    KSObjectDeallocator _dealocatorFunctionPointer;
    
} KSObject;



extern
void *__KSObjectCreate(size_t size, KSObjectDeallocator deallocator);

extern
void __KSObjectDeallocate(void *object);

extern
uint64_t KSObjectRetainCount(void *object);

extern
void KSObjectRelease(void *object);

extern
void *KSObjectRetain(void *object);

#endif /* KSObject_h */
