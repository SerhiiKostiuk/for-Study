//
//  director.m
//  LearningDevelop
//
//  Created by Serg Bla on 08.12.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import "KSDirector.h"
#import "KSAccountant.h"

@implementation KSDirector

#pragma mark -
#pragma mark Private

- (void)processObject:(KSEmployee *)accountant {
    @autoreleasepool {
        [accountant giveMoney:accountant.moneyAmount toReceiver:self];
        accountant.state = kKSEmployeeDidBecomeFree;
        [self moneyIncome];
        self.state = kKSEmployeeDidBecomeFree;
    }
}

- (void)moneyIncome {
    NSLog(@"Director's Income is %lu money", self.moneyAmount);
}

@end
