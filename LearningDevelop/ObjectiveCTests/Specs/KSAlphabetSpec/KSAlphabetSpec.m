//
//  KSAlphabetSpec.m
//  LearningDevelop
//
//  Created by Serg Bla on 04.12.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "Kiwi.h"
#import "KSAlphabet.h"
#import "KSRangeAlphabet.h"
#import "KSClusterAlphabet.h"
#import "KSStringsAlphabet.h"

SPEC_BEGIN(KSAlphabetSpec)

describe(@"KSAlphabet", ^{
    __block KSAlphabet *alphabet = nil;
    
//    + (instancetype)alphabetWithRange:(NSRange)range;
//    + (instancetype)alphabetWithStrings:(NSArray *)strings;
//    + (instancetype)alphabetWithAlphabets:(NSArray *)alphabets;
//    + (instancetype)alphabetWithSymbols:(NSString *)string;
//    
//    - (instancetype)initWithRange:(NSRange)range;
//    - (instancetype)initWithAlphabets:(NSArray *)alphabets;
//    - (instancetype)initWithStrings:(NSArray *)strings;
//    - (instancetype)initWithSymbols:(NSString *)string;
//    
//    - (NSUInteger)count;
//    - (NSString *)stringAtIndex:(NSUInteger)index;
//    - (NSString *)objectAtIndexedSubscript:(NSUInteger)index;
//    
//    - (NSString *)string;

    
    context(@"when initialized with + alphabetWithRange:", ^{
        
        
        beforeAll(^{
            // Occurs once
            alphabet = [KSAlphabet alphabetWithRange:NSMakeRange('A', 'K'-'A')];
        });
        
        afterAll(^{ // Occurs once
        });
        
        beforeEach(^{ // Occurs before each enclosed "it"
        });
        
        afterEach(^{ // Occurs after each enclosed "it"
        });
        
        it(@"should do something", ^{
         //   [[variable should] meetSomeExpectation];
        });
        
        specify(^{
         //   [[variable shouldNot] beNil];
        });
        
        context(@"inner context", ^{
            it(@"does another thing", ^{
            });
            
            pending(@"something unimplemented", ^{
            });
        });
    });
});

SPEC_END
