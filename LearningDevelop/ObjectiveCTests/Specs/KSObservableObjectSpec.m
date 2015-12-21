//
//  KSObservableObjectSpec.m
//  LearningDevelop
//
//  Created by Serg Bla on 20.12.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import <Kiwi/Kiwi.h>

#import "KSObservableObject.h"
#import "KSWeakReference.h"

SPEC_BEGIN(KSObservableObjectSpec)

describe(@"KSObservableObject", ^{
    
    context(@"after object created", ^{
        __block KSObservableObject *object = nil;
        beforeAll(^{
            object = [[KSObservableObject alloc]init];
        });
        
        it(@"observers count must be 0", ^{
            [[theValue(object.observers.count) should] equal:theValue(0)];
        });
        
        it(@"object must not be nil", ^{
            [[object should] beNonNil];
        });
        
        context(@"after observer added", ^{
            __block id observer = [NSObject new];
            
            beforeAll(^{
                [object addObserver:observer];
            });
            
            it(@"contains 1 observer", ^{
                [[theValue(object.observers.count) should] equal:theValue(1)];
            });
            
            it(@"observer must be equal to object", ^{
                KSWeakReference *reference = [object.observers firstObject];
                [[reference.target should] beIdenticalTo:observer];
            });
            
            afterAll(^{
                [object removeObserver:observer];
            });
        });
        
        context(@"after observer added twice", ^{
            id observer2 = [NSObject new];
            
            beforeAll(^{
                [object addObserver:observer2];
                [object addObserver:observer2];
            });
            
            it(@"contains 1 observer", ^{
                [[theValue(object.observers.count) should] equal:theValue(1)];
            });
            
            it(@"observer must be equal to object", ^{
                KSWeakReference *reference = [object.observers firstObject];
                [[reference.target should] beIdenticalTo:observer2];
            });
        });
    });
});


SPEC_END

