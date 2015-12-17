//
//  KSAlphabetSpec.m
//  LearningDevelop
//
//  Created by Serg Bla on 04.12.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "Kiwi.h"
#import "KSEnterprise.h"
#import "KSDirector.h"
#import "KSAccountant.h"
#import "KSWasher.h"
#import "KSCar.h"


SPEC_BEGIN(KSCarWashSpec)

describe(@"KSEnterprise", ^{
    
    context(@"Create Enterprise", ^{
        
        beforeAll(^{
//            alphabet = [KSAlphabet alphabetWithRange:KSMakeAlphabetRange('A', 'K')];
        });
        
        it(@"Create", ^{
            KSEnterprise *enterprise = [KSEnterprise enterprise];
            
            NSLog(@"Enterprise is %@", enterprise);
            
            KSDirector *director = [KSDirector employeeWithSalary:10000 experience:5];
            [enterprise hireEmployee:director];
            NSLog(@"Director is %@", director);
            
            KSAccountant *accountant = [KSAccountant employeeWithSalary:7000 experience:3];
            [enterprise hireEmployee:accountant];
            NSLog(@"Accountant is %@", accountant);
            
            KSWasher *washer = [KSWasher employeeWithSalary:3000 experience:1];
            [enterprise hireEmployee:washer];
            NSLog(@"Washer is %@", washer);
            
            NSArray *cars = [NSArray arrayWithObjects:  [KSCar carWithMoney:20],
                             [KSCar carWithMoney:15],
                             [KSCar carWithMoney:9],
                             [KSCar carWithMoney:18], nil];
            for (KSCar *car in cars) {
                NSLog(@"Is car clean: %hhd Money is: %lu", car.isClean, car.wallet);
            }
            
            for (KSCar *car in cars) {
                [washer performPositionSpecificOperation:car];
                NSLog(@"Is car clean: %hhd Money is: %lu", car.isClean, car.wallet);
            }
            [accountant performPositionSpecificOperation:washer];
            [director performPositionSpecificOperation:accountant];
            
            
        });
        
        it(@"Create", ^{
            KSEnterprise *enteprise = [KSEnterprise enterprise];
            
            [enteprise defaultSetup];
        });
    
    });
});

SPEC_END
