//
//  KSLinkedListTests.c
//  LerningCPart1
//
//  Created by Serg Bla on 12.11.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#include <assert.h>
#include "KSString.h"
#include "KSLinkedList.h"
#include "KSLinkedListTests.h"
#include "KSLinkedListEnumerator.h"

#pragma mark -
#pragma mark Private Declarations

static
void KSLinkedListObjectTest(void);

static
void KSLinkedListEnumeratorTest(void);

static
void KSLikedListWithArrayTest(void);

#pragma mark -
#pragma mark Public Implementations

void KSLinkedListBehaviourTest(void) {
    KSLinkedListObjectTest();
    KSLinkedListEnumeratorTest();
    KSLikedListWithArrayTest();
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
    uint64_t objectRetainCount = KSObjectRetainCount(object);
    
    //      list mustn't contain object
    assert(false == KSLinkedListContainsObject(list, object));
    
    // after object was added to list
    KSLinkedListAddObject(list, object);
    
    //      object retain count must be 2
    assert(objectRetainCount + 1 == KSObjectRetainCount(object));
    
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
    
    //      list count must be 0
    assert(0 == KSLinkedListCount(list));
    
    //      object retain count must be 1
    assert(objectRetainCount == KSObjectRetainCount(object));
    
    // after object was added 15 times
    for (uint8_t iterator = 0; iterator < 15; iterator++) {
        KSLinkedListAddObject(list, object);
    }
    
    //      list should not be empty
    assert(false == KSLinkedListIsEmpty(list));
    
    //      list must contain object
    assert(true == KSLinkedListContainsObject(list, object));
    
    //      list count must be 15
    assert(15 == KSLinkedListCount(list));
    
    //      object retain count must be 16
    assert(objectRetainCount + 15 == KSObjectRetainCount(object));
    
    // after removed first object from list
    KSLinkedListRemoveFirstObject(list);
    
    //      object retain count must be 15
    assert(objectRetainCount + 14 == KSObjectRetainCount(object));
    
    // after deleted all objects
    KSLinkedListRemoveAllObjects(list);
    
    //      object retain count must be 1
    assert(objectRetainCount == KSObjectRetainCount(object));
    
    //      list should be empty
    assert(true == KSLinkedListIsEmpty(list));
    
    //      list must not contain object
    assert(false == KSLinkedListContainsObject(list, object));
    
    //      list count must be 0
    assert(0 == KSLinkedListCount(list));
    


    KSObjectRelease(object);
    KSObjectRelease(list);
}

typedef void (*KSTestFunction) (void **objects, const uint64_t count);

static
void KSLinkedListWithArrayOfCount(KSTestFunction function, void ** objects, const uint64_t count);

void KSTestNotNULL(void **objects, const uint64_t count) {
    for (uint64_t index = 0; index < count; index++) {
        assert(NULL != objects[index]);
    }
}

void KSTestRelease(void **objects, const uint64_t count) {
    for (uint64_t index = 0; index < count; index++) {
        KSObjectRelease(objects[index]);
    }

}

void KSLikedListWithArrayTest(void) {
    // write a macros
#define KSMapWithArray(function, array) \
KSLinkedListWithArrayOfCount(function, (void **)array, sizeof(array) / sizeof(*array));
    // after list was created
    KSLinkedList *list = KSObjectCreateOfType(KSLinkedList);
    
    // after array with objects was created
    KSObject *origin[] = { KSObjectCreateOfType(KSObject),
                            KSObjectCreateOfType(KSString),
                            KSObjectCreateOfType(KSObject)};
    
    KSMapWithArray(KSTestNotNULL, origin);
    KSMapWithArray(KSTestRelease, origin);
    
    KSObjectRelease(list);


}
void KSLinkedListEnumeratorTest(void) {
    // after list was created
    KSLinkedList *list = KSObjectCreateOfType(KSLinkedList);
    
    // added 5 objects to list
    for (uint8_t index = 0; index < 5; index++) {
        KSObject * object = KSObjectCreateOfType(KSObject);
        
        KSLinkedListAddObject(list, object);
        KSObjectRelease(object);
    }
    
    // list retain count must be 1
    assert(1 == KSObjectRetainCount(list));
    
    // list count must be 5
    assert(5 == KSLinkedListCount(list));
    
    // after enumerator was created
    KSLinkedListEnumerator *enumerator = KSLinkedListEnumeratorFromList(list);
    
    //      list retain count should be 2
    assert(2 == KSObjectRetainCount(list));
    
    //      enumerator retain count should be 1
    assert(1 == KSObjectRetainCount(enumerator));

    KSObjectRelease(list);
 





}