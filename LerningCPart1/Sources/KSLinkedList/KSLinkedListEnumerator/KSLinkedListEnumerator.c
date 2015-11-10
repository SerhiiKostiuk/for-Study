//
//  KSLinkedListEnumerator.c
//  LerningCPart1
//
//  Created by Serg Bla on 10.11.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#include <assert.h>
#include "KSLinkedListEnumerator.h"
#include "KSLinkedListNode.h"
#include "KSLinkedListPrivate.h"

#pragma mark -
#pragma mark Private Declarations

static
void KSLinkedListEnumeratorSetValid(KSLinkedListEnumerator *enumerator, bool valid);

static
KSLinkedList *KSLinkedListEnumeratorList(KSLinkedListEnumerator *enumerator);

static
void KSLinkedListEnumeratorSetList(KSLinkedListEnumerator *enumerator, KSLinkedList *list);

static
KSLinkedListNode *KSLinkedListEnumeratorNode(KSLinkedListEnumerator *enumerator);

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


#pragma mark -
#pragma mark Public Implementations
