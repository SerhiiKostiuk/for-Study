//
//  accountant.m
//  LearningDevelop
//
//  Created by Serg Bla on 08.12.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//
#import "KSDirector.h"
#import "KSAccountant.h"
@implementation KSAccountant

- (void)performPositionSpecificOperation:(KSEmployee *)washer {    
    [self takeMoney:washer.wallet fromSender:washer];
}

@end
