//
//  KSLinkedListNode.h
//  LerningCPart1
//
//  Created by Serg Bla on 10.11.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#ifndef KSLinkedListNode_h
#define KSLinkedListNode_h

#include <stdio.h>
#include "KSObject.h"

typedef struct KSLinkedListNode KSLinkedListNode;

struct KSLinkedListNode {
    KSObject _super;
    
    KSLinkedListNode *_newNode;
    void *_object;
};

extern
void __KSLinkedListNodeDeallocate(void *object);

extern
KSLinkedListNode *KSLinkedListNodeCreateWithObject(void *object);

extern
KSLinkedListNode *KSLinkedListNodeNextNode(KSLinkedListNode *node);

extern
void KSLinkedListNodeSetNextNode(KSLinkedListNode *node, KSLinkedListNode *nextNode);

extern
KSObject *KSLinkedListNodeObject(KSLinkedListNode *node);

extern
void KSLinkedListNodeSetObject(KSLinkedListNode *node, void *object); 

#endif /* KSLinkedListNode_h */
