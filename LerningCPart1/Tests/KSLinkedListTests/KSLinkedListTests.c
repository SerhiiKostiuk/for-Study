//
//  KSLinkedListTests.c
//  LerningCPart1
//
//  Created by Serg Bla on 12.11.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#include <assert.h>
#include "KSLinkedList.h"
#include "KSLinkedListTests.h"
#include "KSLinkedListEnumerator.h"

#pragma mark -
#pragma mark Private Declarations

static
void KSLinkedListObjectTest(void);

static
void KSLinkedListEnumeratorTest(void);

#pragma mark -
#pragma mark Public Implementations

void KSLinkedListBehaviourTest(void) {
    KSLinkedListObjectTest();
    KSLinkedListEnumeratorTest();
}

#pragma mark -
#pragma mark Private Implementations

void KSLinkedListObjectTest(void) {
    // after list was created
    KSLinkedList *list = KSObjectCreateOfType(KSLinkedList);
    
    //      list should be empty
    assert(true == KSLinkedListIsEmpty(list));
    
    // after object was created
    KSObject *object = KSObjectCreateOfType(KSObject);
    
    //      list mustn't contain object
    assert(false == KSLinkedListContainsObject(list, object));
    
    // after object was added to list
    KSLinkedListAddObject(list, object);
    
    //      object retain count must be 2
    assert(2 == KSObjectRetainCount(object));
    
    //      list should not be empty
    assert(false == KSLinkedListIsEmpty(list));
    
    //      list must contain object
    assert(true == KSLinkedListContainsObject(list, object));
    
    // after object was removed from list
    KSLinkedListRemoveObject(list, object);
    
    //      list should be empty
    assert(true == KSLinkedListIsEmpty(list));
    
    //      list must not contain object
    assert(false == KSLinkedListContainsObject(list, object));
    
    //      object retain count must be 1
    assert(1 == KSObjectRetainCount(object));
    
    // after object was added 15 times
    for (uint8_t iterator = 0; iterator < 15; iterator++) {
        KSLinkedListAddObject(list, object);
    }
    
    //      list should not be empty
    assert(false == KSLinkedListIsEmpty(list));
    
    //      list must contain object
    assert(true == KSLinkedListContainsObject(list, object));
    
    //      object retain count must be 16
    assert(16 == KSObjectRetainCount(object));
    
    // after removed first object from list
    KSLinkedListRemoveFirstObject(list);
    
    //      object retain count must be 15
    assert(15 == KSObjectRetainCount(object));
    
    // after deleted all objects
    KSLinkedListRemoveAllObjects(list);
    
    //      object retain count must be 1
    assert(1 == KSObjectRetainCount(object));
    
    //      list should be empty
    assert(true == KSLinkedListIsEmpty(list));
    
    //      list must not contain object
    assert(false == KSLinkedListContainsObject(list, object));

    KSObjectRelease(object);
    KSObjectRelease(list);
}

void KSLinkedListEnumeratorTest(void) {
    // after list was created
    KSLinkedList *list = KSObjectCreateOfType(KSLinkedList);

    KSObjectRelease(list);






}