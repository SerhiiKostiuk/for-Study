//
//  KSCarWashTests.m
//  LearningDevelop
//
//  Created by Serg Bla on 27.12.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import "KSCarWashTests.h"
#import "KSController.h"

@implementation KSCarWashTests

+(void)carWashTests {
    [KSCarWashTests performCarWashTests];
}

+(void)performCarWashTests {
    
    KSController *controller = [KSController object];
    controller.working = YES;
    
    [[NSRunLoop currentRunLoop] run];
    
    
    
}

@end
