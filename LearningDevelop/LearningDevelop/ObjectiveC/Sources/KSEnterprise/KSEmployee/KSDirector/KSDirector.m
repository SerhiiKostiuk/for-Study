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

- (void)performPositionSpecificOperation:(KSEmployee *)accountant {
    [self takeMoney:accountant.wallet fromSender:accountant];
    NSLog(@"Wallet is %lu",self.wallet);
    
}

@end
