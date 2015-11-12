//
//  KSLinkedListEnumerator.h
//  LerningCPart1
//
//  Created by Serg Bla on 10.11.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#ifndef KSLinkedListEnumerator_h
#define KSLinkedListEnumerator_h

#include <stdio.h>
#include <stdbool.h>
#include "KSObject.h"

typedef struct KSLinkedListEnumerator KSLinkedListEnumerator;
typedef struct KSLinkedListNode KSLinkedListNode;
typedef struct KSLinkedList KSLinkedList;

struct KSLinkedListEnumerator {
    KSObject _super;
    void *_list;
    KSLinkedListNode *_node;
    uint64_t _mutationsCount;
    bool _valid;
};

extern
void __KSLinkedListEnumeratorDeallocate(void *object);

extern
KSLinkedListEnumerator *KSLinkedListEnumeratorCreateWithList(KSLinkedList *list);

extern
void *KSLinkedListEnumeratorNextObject(KSLinkedListEnumerator *enumerator);

extern
bool KSLinkedListEnumeratorIsValid(KSLinkedListEnumerator *enumerator);

#endif /* KSLinkedListEnumerator_h */
