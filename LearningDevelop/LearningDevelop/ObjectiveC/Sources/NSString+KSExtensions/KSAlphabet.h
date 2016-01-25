//
//  KSAlphabet.h
//  LearningDevelop
//
//  Created by Serg Bla on 01.12.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import <Foundation/Foundation.h>

extern
NSRange KSMakeAlphabetRange(unichar firstValue, unichar secondValue);

@interface KSAlphabet : NSObject <NSFastEnumeration>

+ (instancetype)alphabetWithRange:(NSRange)range;
+ (instancetype)alphabetWithStrings:(NSArray *)strings;
+ (instancetype)alphabetWithAlphabets:(NSArray *)alphabets;
+ (instancetype)alphabetWithSymbols:(NSString *)string;

- (instancetype)initWithRange:(NSRange)range;
- (instancetype)initWithAlphabets:(NSArray *)alphabets;
- (instancetype)initWithStrings:(NSArray *)strings;
- (instancetype)initWithSymbols:(NSString *)string;

- (NSUInteger)count;
- (NSString *)stringAtIndex:(NSUInteger)index;
- (NSString *)objectAtIndexedSubscript:(NSUInteger)index;

- (NSString *)string;

@end
