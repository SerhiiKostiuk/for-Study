//
//  washer.m
//  LearningDevelop
//
//  Created by Serg Bla on 08.12.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import "KSCar.h"
#import "KSWasher.h"
#import "KSWashBox.h"
#import "KSEmployee.h"
#import "KSAccountant.h"
static const NSUInteger kWashPrice = 10;

@interface KSWasher ()

@end

@implementation KSWasher

- (void)performPositionSpecificOperation:(KSCar *)car {
    if (car) {
        if ((self.free = YES) && [car isAbleToPay:kWashPrice]) {            
            [self takeMoney:kWashPrice fromSender:car];
            [car setClean:YES];
        }
    }
}

@end
