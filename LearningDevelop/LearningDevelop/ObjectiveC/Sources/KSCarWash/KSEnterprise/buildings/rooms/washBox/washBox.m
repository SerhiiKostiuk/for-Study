//
//  washBox.m
//  LearningDevelop
//
//  Created by Serg Bla on 12.12.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import "car.h"
#import "washBox.h"
#import "containerForItems.h"

@interface washBox ()
@property (nonatomic, retain) containerForItems *carsContainer;

@end

@implementation washBox

#pragma mark -
#pragma mark Class Methods

+ (BOOL)canContainItemOfClass:(Class)itemClass {
    return [super canContainItemOfClass:itemClass] || [itemClass isSubclassOfClass:[car class]];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.carsContainer = nil;
    
    [super dealloc];
}

- (instancetype)initWithCapacity:(NSUInteger)capacity {
    self = [super initWithCapacity:capacity];
    
    if (self) {
        self.carsContainer = [[[containerForItems alloc] initWithCapacity:capacity] autorelease];
    }
    return self;
}

#pragma mark -
#pragma mark Accessors

- (containerForItems *)cars {
    return self.carsContainer;
}

#pragma mark -
#pragma mark Public

- (void)addCar:(id)car {
    [self.carsContainer addItems:car];
}

- (void)removeCar:(id)car {
    [self.carsContainer removeItems:car];
}

@end
