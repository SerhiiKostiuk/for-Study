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

    afterAll(^{
        alphabet = nil;
    }); 
    
    context(@"when initialized with + alphabetWithRange: with range 'A' - 'K' ", ^{
        
        beforeAll(^{
            alphabet = [KSAlphabet alphabetWithRange:KSMakeAlphabetRange('A', 'K')];
        });
        
        it(@"should be of class KSRangeAlphabet", ^{
            [[alphabet should] beKindOfClass:[KSRangeAlphabet class]];
        });
        
        it(@"should be of count 11", ^{
            [[alphabet should] haveCountOf:11];
        });
        
        it(@"should contain @\"A\" at index = 0 ", ^{
            [[[alphabet stringAtIndex:0] should] equal:@"A"];
        });
        
        it(@"should contain @\"K\" at index = 10 ", ^{
            [[alphabet [10] should] equal:@"K"];
        });
        
        it(@"should raise, when requesting object by index 12, is out of range ", ^{
            [[theBlock(^{
                [alphabet stringAtIndex:12];
            }) should] raise];
            
            [[theBlock(^{
                id value = alphabet[12];
                [value description];
            }) should] raise];
        });
        
        
        it(@"should return @\"ABCDEFGHIJK\" from - string ", ^{
            [[[alphabet string] should] equal:@"ABCDEFGHIJK"];
        });
    });
    
    context(@"when initialized with - initWithRange: with range 'A' - 'K' ", ^{
        
        beforeAll(^{
            alphabet = [[KSAlphabet alloc] initWithRange:KSMakeAlphabetRange('A', 'K')];
        });
        
        it(@"should be of class KSRangeAlphabet", ^{
            [[alphabet should] beKindOfClass:[KSRangeAlphabet class]];
        });
        
    });
    
    context(@"when initialized with + alphabetWithRange: with range 'K' - 'a' when enumerated ", ^{
        NSRange range = KSMakeAlphabetRange('K', 'w');
        
        beforeAll(^{
            alphabet = [[KSAlphabet alloc] initWithRange:range];
        });
        
        it(@"shouldn't raise", ^{
            [[theBlock(^{
                for (id symbol in alphabet) {
                    [symbol description];
                }
            }) shouldNot] raise];
        });
        
        it(@"should return  count of symbols in range 'K' - 'w'", ^{
            NSUInteger count = 0;
            for (NSString *symbol in alphabet) {
                [symbol description]; 
                count++;
            }
            [[theValue(count)should] equal:@(range.length)];
        });
        
        it(@"should return symbols in range 'K' - 'w'", ^{
            unichar character = 'K';
            for (NSString *symbol in alphabet) {
                [[symbol should] equal:[NSString stringWithFormat:@"%C", character]];
                character++;
            }
        });
    });
});

SPEC_END
