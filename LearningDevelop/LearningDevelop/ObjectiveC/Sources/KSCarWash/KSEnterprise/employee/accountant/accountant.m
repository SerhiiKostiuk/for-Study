//
//  accountant.m
//  LearningDevelop
//
//  Created by Serg Bla on 08.12.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//
#import "director.h"
#import "accountant.h"
@implementation accountant

- (void)performPositionSpecificOperation:(employee *)washer {
    Class reciver = [employee class];
    [washer giveMoney:self.money toReciver:self];
    [self giveMoney:self.money toReciver: reciver];
    
}

@end
