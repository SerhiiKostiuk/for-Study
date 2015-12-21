//
//  KSReference.m
//  LearningDevelop
//
//  Created by Serg Bla on 20.12.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import "KSReference.h"

@implementation KSReference
@dynamic target;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.target = nil;
    
    [super dealloc];
}

- (instancetype)initWithTarget:(id)target {
    if (nil == target) {
        return nil;
    }
    self = [super init];
    if (self) {
        self.target = target;
    }
    
    return self;
}

#pragma mark -
#pragma mark NSCopying

- (id)copyWithZone {
    return [[[self class] alloc] initWithTarget:self.target];
}

#pragma mark -
#pragma mark NSObject equlity

- (NSUInteger)hash {
    return [self.target hash];
}

- (BOOL)isEqual:(KSReference *)object {
    return [object isMemberOfClass:[self class]] && object.target == self.target;
}

@end
