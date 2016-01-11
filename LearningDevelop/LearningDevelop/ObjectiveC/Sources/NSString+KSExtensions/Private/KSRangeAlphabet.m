//
//  KSRangeAlphabet.m
//  LearningDevelop
//
//  Created by Serg Bla on 02.12.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import "KSRangeAlphabet.h"

@interface KSRangeAlphabet ()

@property (nonatomic, readwrite) NSRange range;

@end

@implementation KSRangeAlphabet

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithRange:(NSRange)range {
    self = [super init];
    if (self) {
        self.range = range;
    }
    return self;
}

#pragma mark -
#pragma mark Public Methods

- (NSUInteger)count {
    return self.range.length;
}
- (NSString *)stringAtIndex:(NSUInteger)index {
    NSRange range = self.range;
    
    NSAssert(index < range.length, NSRangeException);
    return [NSString stringWithFormat:@"%C", (unichar)(range.location + index)];
}
- (NSString *)objectAtIndexedSubscript:(NSUInteger)index {
    return [self stringAtIndex:index];
}


@end
