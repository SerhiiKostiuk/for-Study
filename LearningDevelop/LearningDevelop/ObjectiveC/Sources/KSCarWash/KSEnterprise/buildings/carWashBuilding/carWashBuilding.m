//
//  carWashBuilding.m
//  LearningDevelop
//
//  Created by Serg Bla on 08.12.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import "car.h"
#import "washBox.h"
#import "carWashBuilding.h"

static const NSUInteger kDefaultRoomCapacity = 1;

@implementation carWashBuilding

#pragma mark -
#pragma mark Class Methods

+ (instancetype)building {
    return [[self alloc] initWithRooms:[NSArray arrayWithObject:[washBox roomWithCapacity:kDefaultRoomCapacity]]];
}

+ (BOOL)canContainItemOfClass:(Class)itemClass {
    return [super canContainItemOfClass:itemClass] || [itemClass isSubclassOfClass:[car class]];
}

@end

