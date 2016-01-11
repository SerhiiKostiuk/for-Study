//
//  accountant.m
//  LearningDevelop
//
//  Created by Serg Bla on 08.12.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//
#import "KSAccountant.h"

@implementation KSAccountant

#pragma mark -
#pragma mark Private

- (void)performSpecificOperationWithObject:(KSEmployee *)washer {
    @autoreleasepool {
        [washer giveMoney:washer.wallet toReceiver:self];
        [self moneyCount];
        washer.state = kKSIsFree;
    }
}

- (void)moneyCount {
    NSLog(@"account has : %lu money", self.wallet);
}

@end
