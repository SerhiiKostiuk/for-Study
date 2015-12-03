//
//  KSAlphabet.m
//  LearningDevelop
//
//  Created by Serg Bla on 01.12.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import "KSAlphabet.h"
#import "KSRangeAlphabet.h"
#import "KSClusterAlphabet.h"
#import "KSStringsAlphabet.h"
#import "KSStringCategories.h"

@implementation KSAlphabet

#pragma mark -
#pragma mark Class Methods

+ (instancetype)alphabetWithRange:(NSRange)range {
    return [[[KSRangeAlphabet alloc] initWithRange:range] autorelease];
}

+ (instancetype)alphabetWithStrings:(NSArray *)strings {
    return [[[KSStringsAlphabet alloc] initWithStrings:strings] autorelease]; 
}

+ (instancetype)alphabetWithAlphabets:(NSArray *)alphabets {
    return [[[KSClusterAlphabet alloc] initWithAlphabets:alphabets] autorelease];
}

+ (instancetype)alphabetWithSymbols:(NSString *)string {
    return [self alphabetWithStrings:[string symbols]];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithRange:(NSRange)range {
    [self release];
    
    return [[KSRangeAlphabet alloc]initWithRange:range];
}
- (instancetype)initWithStrings:(NSArray *)strings {
    [self release];
    
    return [[KSStringsAlphabet alloc]initWithStrings:strings];
}

- (instancetype)initWithAlphabets:(NSArray *)alphabets {
    [self release];
    
    return [[KSClusterAlphabet alloc] initWithAlphabets:alphabets];
}

- (instancetype)initWithSymbols:(NSString *)string {
    return [self initWithStrings:[string symbols]];
}


#pragma mark -
#pragma mark Public Methods

- (NSUInteger)count {
    return 0;
}
- (NSString *)stringAtIndex:(NSUInteger)index {
    return nil;
}
- (NSString *)objectAtIndexedSubscript:(NSUInteger)index {
    return [self stringAtIndex:index];
}

- (NSString *)string {
    NSMutableString *string = [NSMutableString stringWithCapacity:[self count]];
    for (NSString *symbol in self) {
        [string appendString:symbol];
    }
    return [[string copy]autorelease];
}


#pragma mark -
#pragma mark NSFastEnumeration

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state
                                  objects:(id _Nonnull [])stackbuf
                                    count:(NSUInteger)len
{
    return 0;
}

@end
