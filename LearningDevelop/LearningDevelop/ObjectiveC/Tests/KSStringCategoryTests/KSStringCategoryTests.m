//
//  KSStringCategoryTests.m
//  LearningDevelop
//
//  Created by Serg Bla on 30.11.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import "KSStringCategories.h"
#import "KSStringCategoryTests.h"

@implementation KSStringCategoryTests

+ (void) stringTests {
    [KSStringCategoryTests performStringTests];
}

+ (void) performStringTests {

    uint16_t length = 16;
    assert(0 != length);
    
    NSString *givenString = @"@#$%^&*( Hi Everybody";
    assert(givenString);
    
    NSString *randomSrting = [NSString randomStringWithLength:length alphabet:givenString];
    assert(randomSrting || givenString == randomSrting);
    
    NSLog(@" Random string is %@", randomSrting);
}


@end
