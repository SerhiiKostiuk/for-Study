//
//  KSClusterAlphabet.m
//  LearningDevelop
//
//  Created by Serg Bla on 02.12.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import "KSClusterAlphabet.h"

@interface KSClusterAlphabet ()

@property(nonatomic, retain) NSArray    *alphabets;
@property(nonatomic, assign) NSUInteger count;

- (NSUInteger)countWithAlphabets:(NSArray *)alphabets;

@end

@implementation KSClusterAlphabet

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.alphabets = nil;
    
    [super dealloc];
}

- (instancetype)initWithAlphabets:(NSArray *)alphabets {
    self = [super init];
    if (self) {
        self.alphabets = alphabets;
        self.count = [self countWithAlphabets:alphabets];
    }
    
    return self;
}

#pragma mark -
#pragma mark Public Methods

- (NSString *)stringAtIndex:(NSUInteger)index {
    NSUInteger count = self.count;
    NSUInteger iteretedIndex = index;
    
    NSAssert(index < count, NSRangeException);

    for (KSAlphabet *alphabet in self.alphabets) {
        count = [alphabet count];
        
        if (iteretedIndex < count) {
            return alphabet[iteretedIndex];
        }
        
        iteretedIndex -= count;
    }
    
    return nil;
}

- (NSString *)string {
    NSMutableString *string = [NSMutableString stringWithCapacity:[self count]];
    for (KSAlphabet *alphabet in self.alphabets) {
        [string appendString:[alphabet string]];
    }
    
    return [[string copy]autorelease];
}

#pragma mark -
#pragma mark Private Methods

- (NSUInteger)countWithAlphabets:(NSArray *)alphabets {
    NSUInteger count = 0;
    for(KSAlphabet *alphabet in alphabets) {
        count += [alphabet count];
    }
    
    return count;
}

@end
