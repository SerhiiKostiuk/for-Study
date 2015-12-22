//
//  washBox.m
//  LearningDevelop
//
//  Created by Serg Bla on 12.12.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import "KSCar.h"
#import "KSWashBox.h"
#import "KSItemsContainer.h"

@interface KSWashBox ()
@property (nonatomic, readwrite, retain) KSItemsContainer *cars;

@end

@implementation KSWashBox

#pragma mark -
#pragma mark Class Methods

+ (instancetype)roomWithCapacity:(NSUInteger)capacity {
    return [[[self alloc] initWithCapacity:capacity] autorelease];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.cars = nil;
    
    [super dealloc];
}

- (instancetype)initWithCapacity:(NSUInteger)capacity {
    self = [super initWithCapacity:capacity];
    
    if (self) {
        self.cars = [[[KSItemsContainer alloc] initWithCapacity:capacity] autorelease];
    }
    return self;
}

#pragma mark -
#pragma mark Public

- (void)addCar:(id)car {
    [self.cars addItems:car];
}

- (void)removeCar:(id)car {
    [self.cars removeItems:car];
}

- (BOOL)isFullOfCars {
    return [self.cars isFull];
}

@end
