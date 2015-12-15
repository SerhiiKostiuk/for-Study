//
//  washer.m
//  LearningDevelop
//
//  Created by Serg Bla on 08.12.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import "car.h"
#import "washer.h"
#import "washBox.h"
static const NSUInteger kWashPrice = 10;

@interface washer ()
@property (nonatomic, readwrite) BOOL mutableWasherFree;


@end

@implementation washer
@dynamic washerFree;

- (void)performPositionSpecificOperation:(washBox *)carsWashBox {
    if (carsWashBox) {
        if ((self.mutableWasherFree = YES)) {
            for (car *vehicle in carsWashBox.cars) {
                [vehicle giveMoney:kWashPrice toReciver:self];
                [vehicle setClean:YES];
            }
        }
    }
}

-(BOOL)isFree {
    return self.mutableWasherFree;
}


@end
