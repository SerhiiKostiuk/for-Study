//
//  KSLinkedListNode.c
//  LerningCPart1
//
//  Created by Serg Bla on 10.11.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#include <stdlib.h>
#include <assert.h>
#include "KSLinkedListNode.h"

#pragma mark -
#pragma mark Initializations & Dealocation

void __KSLinkedListNodeDeallocate(void *object) {
    KSLinkedListNodeSetObject(object, NULL);
    KSLinkedListNodeSetNextNode(object, NULL);
    
    __KSObjectDeallocate(object);
}

KSLinkedListNode *KSLinkedListNodeCreateWithObject(void *object) {
    KSLinkedListNode *result = KSObjectCreateOfType(KSLinkedListNode);
    KSLinkedListNodeSetObject(result, object);
    
    return result;
}

#pragma mark -
#pragma mark Accessors

KSLinkedListNode *KSLinkedListNodeNextNode(KSLinkedListNode *node) {
    return KSObjectGetter(node, _newNode, NULL);
}

void KSLinkedListNodeSetNextNode(KSLinkedListNode *node, KSLinkedListNode *nextNode) {
    assert(!node || node != nextNode);
    KSObjectRetainSetter(node, _newNode, nextNode);
}


KSObject *KSLinkedListNodeObject(KSLinkedListNode *node) {
    return KSObjectGetter(node, _object, NULL);
}

void KSLinkedListNodeSetObject(KSLinkedListNode *node, void *object) {
    if (NULL != node) {
        assert(node != object);
        
        KSObjectRetainSetter(node, _object, object);
    }
}
