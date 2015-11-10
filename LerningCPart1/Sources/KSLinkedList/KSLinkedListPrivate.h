//
//  KSLinkedListPrivate.h
//  LerningCPart1
//
//  Created by Serg Bla on 10.11.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#ifndef KSLinkedListPrivate_h
#define KSLinkedListPrivate_h

#include "KSLinkedList.h"

typedef struct {
    void *previousNode;
    void *node;
    void *object;
} KSLinkedListNodeContext;

typedef bool (*KSLinkedListNodeComparisonFunction)(KSLinkedListNode *node, KSLinkedListNodeContext context);

extern
KSLinkedListNode *KSLinkedListHead(KSLinkedList *list);

extern
void KSLinkedListSetHead(KSLinkedList *list, KSLinkedListNode *head);

extern
uint64_t KSLinkedListMutationsCount(KSLinkedList *list);

extern
void KSLinkedListSetMutationsCount(KSLinkedList *list, uint64_t count);

extern
KSLinkedListNode *KSLinkedListFindNodeWithContext(KSLinkedList *list,
                                                  KSLinkedListNodeComparisonFunction comparator,
                                                  KSLinkedListNodeContext context);

extern
bool KSLinkedListNodeContainsObject(KSLinkedListNode *node, KSLinkedListNodeContext context);

#endif /* KSLinkedListPrivate_h */
