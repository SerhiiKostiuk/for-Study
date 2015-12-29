//
//  washer.m
//  LearningDevelop
//
//  Created by Serg Bla on 08.12.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import "KSCar.h"
#import "KSWasher.h"
#import "KSEmployee.h"
#import "KSAccountant.h"
static const NSUInteger kWashPrice = 10;

@interface KSWasher ()

@end

@implementation KSWasher
@synthesize state = _state;

- (void)performPositionSpecificOperation:(KSCar *)car {
    @autoreleasepool {

    self.state = kKSIsBusy;
    if ([car isAbleToPay:kWashPrice]) {
        [self washCar:car];
    }
    self.state = kKSWorkDone;
    
    [self notifyObserversWithSelector:@selector(performPositionSpecificOperation:) withObject:self];
    }
}

- (void) washCar:(KSCar *)car {
    if (car) {
        [self takeMoney:kWashPrice fromSender:car];
//        sleep(1);
        [car setClean:YES];
    }
}


@end
