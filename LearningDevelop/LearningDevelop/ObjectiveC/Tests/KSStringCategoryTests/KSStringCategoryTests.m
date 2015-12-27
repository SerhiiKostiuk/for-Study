//
//  KSStringCategoryTests.m
//  LearningDevelop
//
//  Created by Serg Bla on 30.11.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import "KSAlphabet.h"
#import "KSStringCategories.h"
#import "KSStringCategoryTests.h"

#import "CategoryForNSObject.h"
#import "KSEnterprise.h"
#import "KSDirector.h"
#import "KSAccountant.h"
#import "KSWasher.h"
#import "KSCar.h"
//#import "KSCashFlowProtocol.h"

@implementation KSStringCategoryTests

+ (void) stringTests {
    [KSStringCategoryTests performStringTests];
}

+ (void) performStringTests {
    
//    NSLog(@"Our random string is %@", [NSString randomString]);
//    
//    NSLog(@"Our random string with length is %@",[NSString randomStringWithLength:11]);
//    
//    NSLog(@"Our random string with length from alphanumeric alphabet is %@",
//          [NSString randomStringWithLength:11 alphabet:[NSString alphanumericAlphabet]]);
//    
//    NSLog(@"Our random string with length from numeric alphabet is %@",
//          [NSString randomStringWithLength:11 alphabet:[NSString numericAlphabet]]);
//    
//    NSLog(@"Our random string with length from lowercase letters is %@",
//          [NSString randomStringWithLength:11 alphabet:[NSString lowercaseLetters]]);
//    
//    NSLog(@"Our random string with length from uppercase letters is %@",
//          [NSString randomStringWithLength:11 alphabet:[NSString uppercaseLetters]]);
//    NSLog(@"%@",[NSString uppercaseLetters]);
    

    NSUInteger carsCount = 10;
    
    KSEnterprise *enterprise = [KSEnterprise object];
    NSLog(@"Enterprise is %@", enterprise);
    
    [enterprise hireBasicTeam];
    
//    KSDirector *director = [KSDirector employee];
//    [enterprise hireEmployee:director];
//    NSLog(@"Director is %@", director);
//    
//    KSAccountant *accountant = [KSAccountant employee];
//    [enterprise hireEmployee:accountant];
//    NSLog(@"Accountant is %@", accountant);
//    
//    KSWasher *washer = [KSWasher employee];
//    [enterprise hireEmployee:washer];
//    NSLog(@"Washer is %@", washer);
    
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
        NSLog(@"Is car clean: %hhd Money is: %lu", car.isClean, car.wallet);
    }

}
@end
