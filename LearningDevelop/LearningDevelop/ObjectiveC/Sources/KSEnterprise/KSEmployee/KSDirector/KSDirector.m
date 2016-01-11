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

- (void)performSpecificOperationWithObject:(KSEmployee *)accountant {
    @autoreleasepool {
        [accountant giveMoney:self.wallet toReceiver:self];
        accountant.state = kKSIsFree;
        [self moneyIncome];
        self.state = kKSIsFree;
    }
}

- (void)moneyIncome {
    NSLog(@"Director's Income is %lu money", self.wallet);
}

@end
