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
    self.state = kKSIsBusy;
    [self takeMoney:washer.wallet fromSender:washer];
    sleep(2);
    [self notifyObserversWithSelector:@selector(performPositionSpecificOperation:) withObject:self];
    self.state = kKSIsFree;

}

@end
