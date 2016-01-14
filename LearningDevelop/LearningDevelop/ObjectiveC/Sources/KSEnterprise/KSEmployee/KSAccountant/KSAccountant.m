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

- (void)processObject:(KSEmployee *)washer {
    @autoreleasepool {
        [washer giveMoney:washer.moneyAmount toReceiver:self];
        washer.state = kKSEmployeeDidBecomeFree;
        [self countMoney];
        self.state = kKSEmployeeDidFinishWork;        
    }
}

- (void)countMoney {
    NSLog(@"account has : %lu money", self.moneyAmount);
}



@end
