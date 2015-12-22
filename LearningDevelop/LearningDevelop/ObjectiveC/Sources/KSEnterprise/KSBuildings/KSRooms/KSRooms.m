//
//  rooms.m
//  LearningDevelop
//
//  Created by Serg Bla on 08.12.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import "KSRooms.h"
#import "KSEmployee.h"
#import "KSItemsContainer.h"

@interface KSRooms ()
@property (nonatomic, readwrite, retain) KSItemsContainer *staff;

@end

@implementation KSRooms
//@dynamic staff;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)roomWithCapacity:(NSUInteger)capacity {
    return [[[self alloc] initWithCapacity:capacity] autorelease];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.staff = nil;
    
    [super dealloc];
}

- (instancetype)initWithCapacity:(NSUInteger)capacity {
    self = [super init];
    
    if (self) {
        self.staff = [[[KSItemsContainer alloc] initWithCapacity:capacity] autorelease];
    }
    
    return self;
}

#pragma mark -
#pragma mark Public

- (void)addEmployee:(KSEmployee *)employee {
    [self.staff addItems:employee];
}

- (void)removeEmployee:(KSEmployee *)employee {
    [self.staff removeItems:employee];
}

- (BOOL)isFullOfEmployees {
    return [self.staff isFull];
}

@end
