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

@implementation KSStringCategoryTests

+ (void) stringTests {
    [KSStringCategoryTests performStringTests];
}

+ (void) performStringTests {
    
    NSLog(@"Our random string is %@", [NSString randomString]);
    
    NSLog(@"Our random string with length is %@",[NSString randomStringWithLength:11]);
    
    NSLog(@"Our random string with length from alphanumeric alphabet is %@",
          [NSString randomStringWithLength:11 alphabet:[NSString alphanumericAlphabet]]);
    
    NSLog(@"Our random string with length from numeric alphabet is %@",
          [NSString randomStringWithLength:11 alphabet:[NSString numericAlphabet]]);
    
    NSLog(@"Our random string with length from lowercase letters is %@",
          [NSString randomStringWithLength:11 alphabet:[NSString lowercaseLetters]]);
    
    NSLog(@"Our random string with length from uppercase letters is %@",
          [NSString randomStringWithLength:11 alphabet:[NSString uppercaseLetters]]);
    NSLog(@"%@",[NSString uppercaseLetters]);
    
}

@end
