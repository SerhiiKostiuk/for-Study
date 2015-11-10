//
//  KSLinkedList.h
//  LerningCPart1
//
//  Created by Serg Bla on 10.11.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#ifndef KSLinkedList_h
#define KSLinkedList_h

#include <stdlib.h>
#include <stdbool.h>
#include "KSObject.h"

typedef struct KSLinkedListNode KSLinkedListNode;
typedef struct KSLinkedListEnumerator KSLinkedListEnumerator;

typedef struct KSLinkedList KSLinkedList;

struct KSLinkedList {
    KSObject _super;
    KSLinkedListNode *_head;
    uint64_t _count;
    uint64_t _mutationsCount;
};

extern
void __KSLinkedListDeallocate(void *list);

extern
KSLinkedListEnumerator *KSLinkedListEnumeratorFromList(KSLinkedList *list);

extern
KSObject *KSLinkedListFirstObject(KSLinkedList *list);

extern
void KSLinkedListRemoveFirstObject(KSLinkedList *list);

extern
KSObject *KSLinkedListObjectBeforeObject(KSLinkedList *list, KSObject *object);

extern
bool KSLinkedListIsEmpty(KSLinkedList *list);

extern
void KSLinkedListAddObject(KSLinkedList *list, void *object);

extern
void KSLinkedListRemoveObject(KSLinkedList *list, void *object);

extern
void KSLinkedListRemoveAllObjects(KSLinkedList *list);

extern
bool KSLinkedListContainsObject(KSLinkedList *list, void *object);

extern
uint64_t KSLinkedListCount(KSLinkedList *list);

#endif /* KSLinkedList_h */
