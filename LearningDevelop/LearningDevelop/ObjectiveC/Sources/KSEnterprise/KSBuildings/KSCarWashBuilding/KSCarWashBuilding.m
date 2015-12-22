//
//  carWashBuilding.m
//  LearningDevelop
//
//  Created by Serg Bla on 08.12.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import "KSCar.h"
#import "KSWashBox.h"
#import "KSCarWashBuilding.h"

static const NSUInteger kDefaultRoomCapacity = 1;

@implementation KSCarWashBuilding

#pragma mark -
#pragma mark Class Methods

+ (instancetype)building {
    return [[self alloc] initWithRooms:[NSArray arrayWithObject:[KSWashBox roomWithCapacity:kDefaultRoomCapacity]]];
}

@end

