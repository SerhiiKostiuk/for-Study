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
//#import "KSDirector.h"
//#import "KSAccountant.h"
//#import "KSWasher.h"
#import "KSCar.h"

@implementation KSCarWashTests

+(void)carWashTests {
    [KSCarWashTests performCarWashTests];
}

+(void)performCarWashTests {
    NSUInteger carsCount = 5;
    
    KSEnterprise *enterprise = [KSEnterprise object];
    NSLog(@"Enterprise is %@", enterprise);
    
    [enterprise hireBasicTeam];
    
    //            NSArray *cars = [NSArray arrayWithObjects:  [KSCar carWithMoney:20],
    //                             [KSCar carWithMoney:15],
    //                             [KSCar carWithMoney:9],
    //                             [KSCar carWithMoney:18], nil];
    
    NSMutableArray *cars = [NSMutableArray arrayWithCapacity:carsCount];
    for (NSUInteger count = 0; count < carsCount; count++) {
        [cars addObject:[KSCar car]];
    }
    
    [enterprise washCars:cars];

    for (KSCar *car in cars) {
        NSLog(@"Is car clean: %hhd Money is: %lu", car.isClean, car.wallet);
      
    }
    
    NSLog(@"CarWash is finished");
}

@end
