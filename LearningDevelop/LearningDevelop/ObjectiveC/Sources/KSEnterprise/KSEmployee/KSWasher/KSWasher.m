//
//  KSWasher.m
//  LearningDevelop
//
//  Created by Serg Bla on 08.12.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import "KSCar.h"
#import "KSWasher.h"

static const NSUInteger kWashPrice = 10;

@implementation KSWasher

#pragma mark -
#pragma mark Public Implementations

- (void)processObject:(KSCar *)car {
    @autoreleasepool {
        [self washCar:car];
        self.state = kKSEmployeeWorkDone;
    }
}

#pragma mark -
#pragma mark Private Implementations

- (void) washCar:(KSCar *)car {
    if (car) {
        [car giveMoney:kWashPrice toReceiver:self];
        [car setClean:YES];
    }
}


@end
