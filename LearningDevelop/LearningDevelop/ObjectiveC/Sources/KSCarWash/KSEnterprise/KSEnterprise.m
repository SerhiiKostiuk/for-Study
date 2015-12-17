//
//  KSEnterprise.m
//  LearningDevelop
//
//  Created by Serg Bla on 08.12.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import "CategoryForNSObject.h"
#import "KSEmployee.h"
#import "KSBuildings.h"
#import "KSCarWashBuilding.h"
#import "KSEnterprise.h"
#import "KSItemsContainer.h"
#import "KSWashBox.h"
#import "KSWasher.h"
#import "KSAccountant.h"
#import "KSDirector.h"

@interface KSEnterprise ()

@property (nonatomic, retain) KSItemsContainer    *mutableBuildings;
@property (nonatomic, retain) KSItemsContainer    *staffContainer;

@end

@implementation KSEnterprise
@dynamic buildings;

#pragma mark -
#pragma Class Methods

+ (instancetype)enterprise {
    return [[self alloc] initWithOffice:[KSBuildings building] carWash:[KSCarWashBuilding building]];
}

+ (instancetype)enterpriseWithOffice:(KSBuildings *)office carWash:(KSCarWashBuilding *)carWash {
    return [[self alloc] initWithOffice:office carWash:carWash];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc
{
    self.mutableBuildings = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.mutableBuildings = [KSItemsContainer object];
    }
    return self;
}

- (instancetype)initWithOffice:(KSBuildings *)office carWash:(KSCarWashBuilding *)carWash {
    self = [self init];
    
    if (self) {
        [self.mutableBuildings addItems:office];
        [self.mutableBuildings addItems:carWash];
    }
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)buildings {
    return [[_mutableBuildings copy] autorelease];
}

#pragma mark -
#pragma mark Public

- (void)addBuilding:(KSBuildings *)building {
    [_mutableBuildings addItems:building];
}

- (void)removeBuilding:(KSBuildings *)building {
    [_mutableBuildings addItems:building];
}

- (void)hireEmployee:(KSEmployee *)employee {
    [self.staffContainer addItems:employee];
}
- (void)fireEmployee:(KSEmployee *)employee {
    [self.staffContainer removeItems:employee];
}


- (void)defaultSetup {
    
    KSWashBox *washBox = [[[KSWashBox alloc] initWithCapacity:2] autorelease];
    KSCarWashBuilding *washBuilding = [[KSCarWashBuilding alloc] initWithRooms:@[washBox]];
    
    KSRooms *officeRoom = [KSRooms roomWithCapacity:2];
    
    KSBuildings *officeBuilding = [[KSBuildings alloc] initWithRooms:@[officeRoom]];
    
    
    
    KSEnterprise *enterprise = [[KSEnterprise alloc] initWithOffice:officeBuilding carWash:washBuilding];
    
    
    [self hireEmployee:[KSWasher employeeWithSalary:3000 experience:1]];
    
    KSAccountant *accountant = [KSAccountant employeeWithSalary:6000 experience:3];
    ks
    
//[self addBuilding:officeBuilding];
//    [self addBuilding:washBuilding];
    
}


@end
