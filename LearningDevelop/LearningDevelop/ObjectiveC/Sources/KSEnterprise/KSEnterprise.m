
//
//  KSEnterprise.m
//  LearningDevelop
//
//  Created by Serg Bla on 08.12.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import "CategoryForNSObject.h"
#import "KSCar.h"
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
@dynamic staff;

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
    self.staffContainer = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.mutableBuildings = [KSItemsContainer object];
        self.staffContainer = [KSItemsContainer object];
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

- (NSArray *)staff {
    return self.staffContainer.items;
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
    
    
//[self addBuilding:officeBuilding];
//    [self addBuilding:washBuilding];
    
}

- (void)washCars:(NSArray *)cars {
    for (KSCar *car in cars) {
        KSWashBox *washBox = [self findFreeRoomOfClass:[KSWashBox class]];
        if (washBox) {
            [washBox addCar:car];
        }
        KSWasher *washer = [self findFreeWasher];
        if (washer) {
            [washer performPositionSpecificOperation:car];
            [washBox removeCar:car];
        }
        
    }
}




- (id) findFreeRoomOfClass:(Class)roomClass {
    KSRooms *result = nil;

    for (KSBuildings *building in self.mutableBuildings.items) {
        for (KSWashBox *room in [building roomsOfClass:roomClass]) {
            if (![room isFullOfCars]) {
                result = room;
                
                break;
            }
        }
        if(result) {
            break;
        }
    }
    
    return result;
}


- (KSWasher *)findFreeWasher {
    
    KSWasher *washer = nil;
    for (washer in [self.staffContainer itemsOfClass:[KSWasher class]]) {
        if (kKSIsFree == washer.state) {
            break;
        }
    }
    return washer;
}

@end
