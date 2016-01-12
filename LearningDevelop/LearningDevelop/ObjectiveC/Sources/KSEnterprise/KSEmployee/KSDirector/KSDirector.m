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

- (void)processObject:(KSEmployee *)accountant {
    @autoreleasepool {
        [accountant giveMoney:accountant.wallet toReceiver:self];
        accountant.state = kKSEmployeeIsFree;
        [self moneyIncome];
        self.state = kKSEmployeeIsFree;
    }
}

- (void)moneyIncome {
    NSLog(@"Director's Income is %lu money", self.wallet);
}

@end
