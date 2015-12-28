//
//  KSAlphabetSpec.m
//  LearningDevelop
//
//  Created by Serg Bla on 04.12.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "Kiwi.h"
#import "CategoryForNSObject.h"
#import "KSEnterprise.h"
#import "KSDirector.h"
#import "KSAccountant.h"
#import "KSWasher.h"
#import "KSCar.h"

SPEC_BEGIN(KSCarWashSpec)

describe(@"KSEnterprise", ^{
    
    context(@"Create Enterprise", ^{
        
        it(@"Create", ^{
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
            
            for (KSCar *car in cars) {
                NSLog(@"Is car clean: %hhd Money is: %lu", car.isClean, car.wallet);
                [enterprise washCars:cars];
//                 NSLog(@"Is car clean: %hhd Money is: %lu", car.isClean, car.wallet);
            }
            
            
        });
    });
});

SPEC_END
