//
//  KSLinkedList.c
//  LerningCPart1
//
//  Created by Serg Bla on 10.11.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#include <assert.h>
#include <string.h>
#include "KSLinkedList.h"
#include "KSLinkedListNode.h"
#include "KSLinkedListPrivate.h"
#include "KSLinkedListEnumerator.h"
#include "KSLinkedListEnumeratorPrivate.h"

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
    return KSLinkedListEnumeratorCreateWithList(list);
}

#pragma mark -
#pragma mark Public Implementations

KSObject *KSLinkedListFirstObject(KSLinkedList *list) {
    KSLinkedListNode *node = KSLinkedListHead(list);
    return KSLinkedListNodeObject(node);
}

void KSLinkedListRemoveFirstObject(KSLinkedList *list) {
    if (NULL != list && false == KSLinkedListIsEmpty(list)) {
        KSLinkedListNode *node = KSLinkedListHead(list);
        KSLinkedListSetHead(list, KSLinkedListNodeNextNode(node));
        KSLinkedListSetCount(list, KSLinkedListCount(list) - 1);
    }
}

KSObject *KSLinkedListObjectBeforeObject(KSLinkedList *list, KSObject *object) {
    if (NULL != list && false == KSLinkedListIsEmpty(list)) {
        KSLinkedListNode *currentNode = KSLinkedListHead(list);
        KSObject *previousObject = NULL;
        
        do {
            KSObject *currentObject = KSLinkedListNodeObject(currentNode);
            if (object == currentObject) {
                
                return previousObject;
            }
            previousObject = currentObject;
        } while (NULL !=(currentNode = KSLinkedListNodeNextNode(currentNode)));
    }
    
    return NULL;
}

bool KSLinkedListIsEmpty(KSLinkedList *list) {
    return NULL != list && (0 == KSLinkedListCount(list));
}
void KSLinkedListAddObject(KSLinkedList *list, void *object) {
    if (NULL != list && NULL != object) {
        KSLinkedListNode *node = KSLinkedListNodeCreateWithObject(object);
        KSLinkedListNodeSetNextNode(node, KSLinkedListHead(list));
        KSLinkedListSetHead(list, node);
        KSLinkedListSetCount(list, KSLinkedListCount(list) + 1);
        
        KSObjectRelease(node);
    }
}

void KSLinkedListRemoveObject(KSLinkedList *list, void *object) {
    if (NULL != list && NULL != object) {
        KSLinkedListNodeContext context;
        KSLinkedListNode *node;
        
        memset(&context, 0, sizeof(context));
        context.object = object;
        
        while (NULL != (node = KSLinkedListFindNodeWithContext(list, KSLinkedListNodeContainsObject, &context)))
        {
            if (NULL != node) {
                KSLinkedListNodeSetNextNode(context.previousNode, KSLinkedListNodeNextNode(context.node));
                KSLinkedListSetCount(list, KSLinkedListCount(list) - 1);
            }
            
        }
    }
}

void KSLinkedListRemoveAllObjects(KSLinkedList *list) {
    if (NULL != list) {
        KSLinkedListSetHead(list, NULL);
        KSLinkedListSetCount(list, 0);
    }
}

bool KSLinkedListContainsObject(KSLinkedList *list, void *object) {
    bool result = false;
    KSLinkedListEnumerator *enumerator = KSLinkedListEnumeratorCreateWithList(list);
    
    while (KSLinkedListEnumeratorIsValid(enumerator)) {
        if (KSLinkedListEnumeratorNextObject(enumerator) == object) {
            result = true;
            
            break;
        }
    }
    KSObjectRelease(enumerator);
    
    return result;
}

uint64_t KSLinkedListCount(KSLinkedList *list) {
    return KSObjectGetter(list, _count, 0);
}

#pragma mark -
#pragma mark Private Implementations

void KSLinkedListSetCount(KSLinkedList *list, uint64_t count) {
    if (NULL != list) {
        if (0 == count) {
            KSLinkedListSetHead(list, NULL);
        }
        
        list->_count = count;
        KSLinkedListMutate(list);
    }
}

void KSLinkedListSetHead(KSLinkedList *list, KSLinkedListNode *head) {
    KSObjectRetainSetter(list, _head, head);
}

KSLinkedListNode *KSLinkedListHead(KSLinkedList *list) {
    return KSObjectGetter(list, _head, NULL);
}

void KSLinkedListSetMutationsCount(KSLinkedList *list, uint64_t count) {
    KSObjectAssignSetter(list, _mutationsCount, count);
}

uint64_t KSLinkedListMutationsCount(KSLinkedList *list) {
    return KSObjectGetter(list, _mutationsCount, 0);
}

void KSLinkedListMutate(KSLinkedList *list) {
    KSLinkedListSetMutationsCount(list, KSLinkedListMutationsCount(list) + 1);
}

KSLinkedListNode *KSLinkedListFindNodeWithContext(KSLinkedList *list,
                                                  KSLinkedListNodeComparisonFunction comparator,
                                                  KSLinkedListNodeContext *context)
{
    KSLinkedListNode *result = NULL;
    
    if (NULL != list && comparator && context) {
        KSLinkedListEnumerator *enumerator = KSLinkedListEnumeratorCreateWithList(list);
        
        while (true == KSLinkedListEnumeratorIsValid(enumerator)) {
            KSLinkedListNode *node = KSLinkedListEnumeratorNode(enumerator);
            context->node = node;
            
            if (!node) {
                break;
            }
            if (true == comparator(node, *context)) {
                result = node;
                
                break;
            }
            context->previousNode = node;
        }
        KSObjectRelease(enumerator);
    }
    
    return result;
}

bool KSLinkedListNodeContainsObject(KSLinkedListNode *node, KSLinkedListNodeContext context) {
    return (NULL != node) && context.object == KSLinkedListNodeObject(node);
}

