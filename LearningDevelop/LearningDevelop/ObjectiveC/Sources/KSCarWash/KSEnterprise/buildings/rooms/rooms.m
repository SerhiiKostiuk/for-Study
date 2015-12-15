//
//  rooms.m
//  LearningDevelop
//
//  Created by Serg Bla on 08.12.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//


#import "rooms.h"
#import "employee.h"
#import "containerForItems.h"

@interface rooms ()
@property (nonatomic, retain) containerForItems *staffContainer;

@end

@implementation rooms
@dynamic staff;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)roomWithCapacity:(NSUInteger)capacity {
    return [[[self alloc] initWithCapacity:capacity] autorelease];
}


+ (BOOL)canContainItemOfClass:(Class)itemClass {
    return [itemClass isSubclassOfClass:[employee class]];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.staffContainer = nil;
    
    [super dealloc];
}

- (instancetype)initWithCapacity:(NSUInteger)capacity {
    self = [super init];
    
    if (self) {
        self.staffContainer = [[[containerForItems alloc] initWithCapacity:capacity] autorelease];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (containerForItems *) staff {
    return self.staffContainer;
}

#pragma mark -
#pragma mark Public

- (void)addEmployee:(id)employee {
    [self.staffContainer addItems:employee];
}

- (void)removeEmployee:(id)employee {
    [self.staffContainer removeItems:employee];
}

@end
