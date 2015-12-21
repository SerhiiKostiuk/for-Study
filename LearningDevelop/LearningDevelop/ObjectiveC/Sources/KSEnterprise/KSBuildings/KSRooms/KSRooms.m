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
@property (nonatomic, retain) KSItemsContainer *staffContainer;

@end

@implementation KSRooms
@dynamic staff;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)roomWithCapacity:(NSUInteger)capacity {
    return [[[self alloc] initWithCapacity:capacity] autorelease];
}

//+ (BOOL)canContainItemOfClass:(Class)itemClass {
//    return [itemClass isSubclassOfClass:[KSEmployee class]];
//}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.staffContainer = nil;
    
    [super dealloc];
}

- (instancetype)initWithCapacity:(NSUInteger)capacity {
    self = [super init];
    
    if (self) {
        self.staffContainer = [[[KSItemsContainer alloc] initWithCapacity:capacity] autorelease];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (KSItemsContainer *) KSStaff {
    return self.staffContainer;
}

#pragma mark -
#pragma mark Public

- (void)addEmployee:(KSEmployee *)employee {
    [self.staffContainer addItems:employee];
}

- (void)removeEmployee:(id)employee {
    [self.staffContainer removeItems:employee];
}

@end
