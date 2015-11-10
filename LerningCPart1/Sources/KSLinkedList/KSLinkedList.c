//
//  KSLinkedList.c
//  LerningCPart1
//
//  Created by Serg Bla on 10.11.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#include <assert.h>
#include "KSLinkedList.h"
#include "KSLinkedListNode.h"

#pragma mark -
#pragma mark Private Declarations

static
void KSLinkedListSetCount(KSLinkedList *list, uint64_t count);

static
void KSLinkedListMutate(KSLinkedList *list);

#pragma mark -
#pragma mark Initializations & Dealocation


void __KSLinkedListDeallocate(void *list) {
    KSLinkedListRemoveAllObjects(list);
    __KSObjectDeallocate(list);
}

KSLinkedListEnumerator *KSLinkedListEnumeratorFromList(KSLinkedList *list) {
return KS
}

#pragma mark -
#pragma mark Public Implementations

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
