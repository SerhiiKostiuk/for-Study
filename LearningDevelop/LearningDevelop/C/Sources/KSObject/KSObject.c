//
//  KSObject.c
//  LerningCPart1
//
//  Created by Serg Bla on 21.10.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#include <stdlib.h>
#include <assert.h>
#include "KSObject.h"

#pragma mark -
#pragma mark Public Implementations

void *__KSObjectCreate(size_t size, KSObjectDeallocator deallocator) {
    assert(0 != size);
    assert(NULL != deallocator);
    
    KSObject *object = calloc(1, size);
    
    assert(NULL != object);
    
    object->_retainCount = 1;
    object->_dealocatorFunctionPointer = deallocator;
    
    return object;
}

void __KSObjectDeallocate(void *object) {
    if (NULL != object) {
        free(object);
    }
}

uint64_t KSObjectRetainCount(void *object) {
    return object ? ((KSObject *)object)->_retainCount : 0;
}

void KSObjectRelease(void *object) {
    if (NULL != object) {
        
        if (0 == --((KSObject *)object)->_retainCount) {
            KSObjectDeallocator deallocator = ((KSObject *)object)->_dealocatorFunctionPointer;
            
            deallocator(object);
        }
    }
}

void *KSObjectRetain(void *object) {
    if (NULL != object) {
        ((KSObject *)object)->_retainCount++;
    }
    
    return object;
}
