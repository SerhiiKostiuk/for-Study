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
            unichar character = range.location;
            for (NSString *symbol in alphabet) {
                [[symbol should] equal:[NSString stringWithFormat:@"%C", character]];
                character++;
            }
        });
    });
//
    context(@"when initialized with + alphabetWithStrings: with @[@\"a\", @\"b\"]", ^{
        
        beforeAll(^{
            alphabet = [KSAlphabet alphabetWithStrings:@[@"a",@"b"]];
        });
        
        it(@"should be of class KSStringsAlphabet", ^{
            [[alphabet should] beKindOfClass:[KSStringsAlphabet class]];
        });
        
        it(@"should be of count 2", ^{
            [[alphabet should] haveCountOf:2];
        });
        
        it(@"should contain @\"a\" at index = 0 ", ^{
            [[[alphabet stringAtIndex:0] should] equal:@"a"];
        });
        
        it(@"should contain @\"b\" at index = 1 ", ^{
            [[alphabet [1] should] equal:@"b"];
        });
        
        it(@"should raise, when requesting object by index 3, is out of range ", ^{
            [[theBlock(^{
                [alphabet stringAtIndex:3];
            }) should] raise];
            
            [[theBlock(^{
                id value = alphabet[3];
                [value description];
            }) should] raise];
        });
        
        
        it(@"should return @\"ab\" from - string ", ^{
            [[[alphabet string] should] equal:@"ab"];
        });
    });
    
    context(@"when initialized with - initWithStrings: with @[@\"a\", @\"b\"]", ^{
        
        beforeAll(^{
            alphabet = [[KSAlphabet alloc] initWithStrings:@[@"a", @"b"]];
        });
        
        it(@"should be of class KSStringsAlphabet", ^{
            [[alphabet should] beKindOfClass:[KSStringsAlphabet class]];
        });
        
    });
    
    context(@"when initialized with + alphabetWithStrings: with array containing 'K' - 'w' when enumerated ", ^{
        NSRange range = KSMakeAlphabetRange('K', 'w');
        NSMutableArray *strings = [NSMutableArray new];

        beforeAll(^{
            for (unichar symbol = range.location; symbol < NSMaxRange(range); symbol++) {
                [strings addObject:[NSString stringWithFormat:@"%C", symbol]];
            }
            
            alphabet = [[KSAlphabet alloc] initWithStrings:strings];
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
            unichar character = range.location;
            for (NSString *symbol in alphabet) {
                [[symbol should] equal:[NSString stringWithFormat:@"%C", character]];
                character++;
            }
        });
    });
 //
    context(@"when initialized with + alphabetWithAlphabets: with alphabets in range 'a' - 'z', 'A' - 'Z' ", ^{
        KSAlphabet *lowercaseAlphabet = [KSAlphabet alphabetWithRange:KSMakeAlphabetRange('a', 'z')];
        KSAlphabet *uppercaseAlphabet = [KSAlphabet alphabetWithRange:KSMakeAlphabetRange('A', 'Z')];
        
        
        beforeAll(^{
            alphabet = [KSAlphabet alphabetWithAlphabets:@[lowercaseAlphabet,uppercaseAlphabet]];
        });
        
        it(@"should be of class KSClusterAlphabet", ^{
            [[alphabet should] beKindOfClass:[KSClusterAlphabet class]];
        });
        
        it(@"should be of count 52", ^{
            [[alphabet should] haveCountOf:52];
        });
        
        it(@"should raise, when requesting object by index 3, is out of range ", ^{
            [[theBlock(^{
                [alphabet stringAtIndex:53];
            }) should] raise];
            
            [[theBlock(^{
                id value = alphabet[53];
                [value description];
            }) should] raise];
        });
        
        
        it(@"should return @\"a-z A-Z\" from - string ", ^{
            NSString *string = [NSString stringWithFormat:@"%@%@",[lowercaseAlphabet string],[uppercaseAlphabet string]];
            [[[alphabet string] should] equal:string];
        });
    });
    
    context(@"when initialized with - initWithAlphabet: with alphabets in range 'a' - 'z', 'A' - 'Z'", ^{
        KSAlphabet *lowercaseAlphabet = [KSAlphabet alphabetWithRange:KSMakeAlphabetRange('a', 'z')];
        KSAlphabet *uppercaseAlphabet = [KSAlphabet alphabetWithRange:KSMakeAlphabetRange('A', 'Z')];
        
        beforeAll(^{
            alphabet = [[KSClusterAlphabet alloc] initWithAlphabets:@[lowercaseAlphabet,uppercaseAlphabet]];
        });
        
        it(@"should be of class KSClusterAlphabet", ^{
            [[alphabet should] beKindOfClass:[KSClusterAlphabet class]];
        });
        
    });
    
    context(@"when initialized with + alphabetWithAlphabets: with array containing 'K' - 'w' when enumerated ", ^{
        NSRange lowercaseRange = KSMakeAlphabetRange('a', 'z');
        NSRange uppercaseRange = KSMakeAlphabetRange('A', 'Z');
        KSAlphabet *lowercaseAlphabet = [KSAlphabet alphabetWithRange:lowercaseRange];
        KSAlphabet *uppercaseAlphabet = [KSAlphabet alphabetWithRange:uppercaseRange];
        
        beforeAll(^{
            alphabet = [[KSClusterAlphabet alloc] initWithAlphabets:@[lowercaseAlphabet,uppercaseAlphabet]];
        });
        
        it(@"shouldn't raise", ^{
            [[theBlock(^{
                for (id symbol in alphabet) {
                    [symbol description];
                }
            }) shouldNot] raise];
        });
        
        it(@"should return  count of symbols in range a' - 'z' + 'A' - 'Z'", ^{
            NSUInteger count = 0;
            for (NSString *symbol in alphabet) {
                [symbol description];
                count++;
            }
            [[theValue(count)should] equal:@([lowercaseAlphabet count] +[uppercaseAlphabet count])];
        });
        
        it(@"should return symbols in range a' - 'z' + 'A' - 'Z'", ^{
            NSMutableString *string = [NSMutableString stringWithString:[lowercaseAlphabet string]];
            [string appendString:[uppercaseAlphabet string]];
            
            NSUInteger index = 0;
            for (NSString *symbol in alphabet) {
                [[symbol should] equal:[NSString stringWithFormat:@"%C", [string characterAtIndex:index]]];
                index++;
            }
        });
    });
});

SPEC_END
