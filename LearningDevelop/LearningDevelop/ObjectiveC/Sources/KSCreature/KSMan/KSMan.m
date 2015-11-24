//
//  KSMan.m
//  LearningDevelop
//
//  Created by Serg Bla on 24.11.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import "KSMan.h"

@interface KSMan ()

-(void)goFight;

@end

@implementation KSMan

-(KSCreatureGenderType)gender {
    return kKSCreatureGenderMale;
}

#pragma mark-
#pragma mark KSCreatureProtocol

-(id)performGenderSpecificOperation {
    [self goFight];
    
    return nil;
}

-(void)goFight {
     NSLog(@"Let's Fight !!!");
}

@end
