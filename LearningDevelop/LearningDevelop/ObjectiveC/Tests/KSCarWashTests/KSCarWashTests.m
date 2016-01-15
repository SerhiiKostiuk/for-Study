//
//  KSCarWashTests.m
//  LearningDevelop
//
//  Created by Serg Bla on 27.12.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import "KSCarWashTests.h"
#import "NSObject+KSExtensions.h"
#import "KSEnterprise.h"
#import "KSCar.h"

@implementation KSCarWashTests

+(void)carWashTests {
    [KSCarWashTests performCarWashTests];
}

+(void)performCarWashTests {
    NSUInteger carsCount = 500;
    KSEnterprise *enterprise = [KSEnterprise object];
    NSMutableArray *cars = [NSMutableArray arrayWithCapacity:carsCount];

    for (NSUInteger count = 0; count < carsCount; count++) {
        [cars addObject:[KSCar car]];
    }
    
    [enterprise washCars:cars];
}

@end
