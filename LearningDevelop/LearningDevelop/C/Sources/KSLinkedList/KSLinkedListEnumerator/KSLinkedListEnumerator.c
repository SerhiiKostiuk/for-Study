//
//  KSLinkedListEnumerator.c
//  LerningCPart1
//
//  Created by Serg Bla on 10.11.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#include <assert.h>
#include "KSMacros.h"
#include "KSLinkedListNode.h"
#include "KSLinkedListPrivate.h"
#include "KSLinkedListEnumerator.h"

#pragma mark -
#pragma mark Private Declarations

static
void KSLinkedListEnumeratorSetValid(KSLinkedListEnumerator *enumerator, bool valid);

static
KSLinkedList *KSLinkedListEnumeratorList(KSLinkedListEnumerator *enumerator);

static
void KSLinkedListEnumeratorSetList(KSLinkedListEnumerator *enumerator, KSLinkedList *list);

static
void KSLinkedListEnumeratorSetNode(KSLinkedListEnumerator *enumerator, KSLinkedListNode *node);

static
uint64_t KSLinkedListEnumeratorMutationsCount(KSLinkedListEnumerator *enumerator);

static
void KSLinkedListEnumeratorSetMutationsCount(KSLinkedListEnumerator *enumerator, uint64_t mutationsCount);

static
bool KSLinkedListEnumeratorMutationsValidate(KSLinkedListEnumerator *enumerator);

#pragma mark -
#pragma mark Initializations & Dealocation

void __KSLinkedListEnumeratorDeallocate(void *object) {
    KSLinkedListEnumeratorSetNode(object, NULL);
    KSLinkedListEnumeratorSetList(object, NULL);
    
    __KSObjectDeallocate(object);
}

KSLinkedListEnumerator *KSLinkedListEnumeratorCreateWithList(KSLinkedList *list) {
    KSLinkedListEnumerator *enumerator = NULL;
    
    if (NULL != KSLinkedListHead(list)) {
        enumerator = KSObjectCreateOfType(KSLinkedListEnumerator);
        KSLinkedListEnumeratorSetList(enumerator, list);
        KSLinkedListEnumeratorSetMutationsCount(enumerator, KSLinkedListMutationsCount(list));
        KSLinkedListEnumeratorSetValid(enumerator, true);
    }
    
    return enumerator;
}
 
#pragma mark -
#pragma mark Accessors

void KSLinkedListEnumeratorSetValid(KSLinkedListEnumerator *enumerator, bool valid) {
    KSObjectAssignSetter(enumerator, _valid, valid);
}

KSLinkedList *KSLinkedListEnumeratorList(KSLinkedListEnumerator *enumerator) {
    return KSObjectGetter(enumerator, _list, NULL);
}

void KSLinkedListEnumeratorSetList(KSLinkedListEnumerator *enumerator, KSLinkedList *list) {
    KSObjectRetainSetter(enumerator, _list, list);
}

KSLinkedListNode *KSLinkedListEnumeratorNode(KSLinkedListEnumerator *enumerator) {
    return KSObjectGetter(enumerator, _node, NULL);
}

void KSLinkedListEnumeratorSetNode(KSLinkedListEnumerator *enumerator, KSLinkedListNode *node) {
    KSObjectRetainSetter(enumerator, _node, node);
}

uint64_t KSLinkedListEnumeratorMutationsCount(KSLinkedListEnumerator *enumerator) {
    return KSObjectGetter(enumerator, _mutationsCount, 0);
}

void KSLinkedListEnumeratorSetMutationsCount(KSLinkedListEnumerator *enumerator, uint64_t mutationsCount) {
    KSObjectAssignSetter(enumerator, _mutationsCount, mutationsCount);
}

bool KSLinkedListEnumeratorIsValid(KSLinkedListEnumerator *enumerator) {
    bool result = false;
    
    if (NULL != enumerator) {
        KSLinkedList *list = KSLinkedListEnumeratorList(enumerator);
        
        result = (true == enumerator->_valid
                  && KSLinkedListMutationsCount(list) == KSLinkedListEnumeratorMutationsCount(enumerator));
    }
    
    return result;
}

#pragma mark -
#pragma mark Public Implementations

void *KSLinkedListEnumeratorNextObject(KSLinkedListEnumerator *enumerator) {
    void *object = NULL;
    
    if (NULL != enumerator && KSLinkedListEnumeratorMutationsValidate(enumerator)) {
        KSLinkedList *list = KSLinkedListEnumeratorList(enumerator);
        KSLinkedListNode *node = KSLinkedListEnumeratorNode(enumerator);
        
        node =(NULL != node ? KSLinkedListNodeNextNode(node) : KSLinkedListHead(list));
        
        KSLinkedListEnumeratorSetNode(enumerator, node);
        
        object = KSLinkedListNodeObject(node); 
        
        if (NULL == node) {
            KSLinkedListEnumeratorSetValid(enumerator, false);
        }
    }
    return object;
}

#pragma mark -
#pragma mark Private Implementations

bool KSLinkedListEnumeratorMutationsValidate(KSLinkedListEnumerator *enumerator) {
    bool valid = KSLinkedListEnumeratorIsValid(enumerator);
    
    assert(valid);
    
    return valid;
}