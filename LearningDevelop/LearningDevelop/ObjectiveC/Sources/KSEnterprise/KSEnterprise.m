
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

@property (nonatomic, readwrite, retain) NSMutableArray    *mutableBuildings;
@property (nonatomic, readwrite, retain) NSMutableArray    *staffContainer;

- (id) findFreeRoomOfClass:(Class)roomClass;
- (id) findFreeEmployee:(Class)class;

@end

@implementation KSEnterprise
@dynamic staff;

#pragma mark -
#pragma Class Methods

+ (instancetype)enterprise {
    return [[self alloc] initWithOffice:[KSBuildings building] carWash:[KSCarWashBuilding building]];
}

+ (instancetype)enterpriseWithOffice:(KSBuildings *)office carWash:(KSBuildings *)carWash {
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
        self.mutableBuildings = [NSMutableArray array];
        self.staffContainer = [NSMutableArray array];
    }
    return self;
}

- (instancetype)initWithOffice:(KSBuildings *)office carWash:(KSBuildings *)carWash {
    self = [self init];
    
    if (self) {
        [self.mutableBuildings addObject:office];
        [self.mutableBuildings addObject:carWash];
    }
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)buildings {
    return [[self.mutableBuildings copy] autorelease] ;
}

- (NSArray *)staff {
    return [[self.staffContainer copy] autorelease];
}

#pragma mark -
#pragma mark Public

- (void)addBuilding:(KSBuildings *)building {
    [self.mutableBuildings addObject:building];
}

- (void)removeBuilding:(KSBuildings *)building {
    [self.mutableBuildings removeObject:building];
}

- (void)hireEmployee:(KSEmployee *)employee {
    [self.staffContainer addObject:employee];
}
- (void)fireEmployee:(KSEmployee *)employee {
    [self.staffContainer removeObject:employee];
}



- (void)washCars:(NSArray *)cars {
    KSWashBox *washBox = [self findFreeRoomOfClass:[KSWashBox class]];
    KSWasher *washer = [self findFreeEmployee:[KSWasher class]];
    KSAccountant *accountant = [self findFreeEmployee:[KSAccountant class]];
    KSDirector *director = [self findFreeEmployee:[KSDirector class]];
    for (KSCar *car in cars) {
        if (washBox) {
            [washBox addCar:car];
        } else {
            break;
        }
        
        if (washer) {
            [washer addObserver:accountant];
            [accountant addObserver:director];
            
            [washer performPositionSpecificOperation:car];
            [washBox removeCar:car];
            
            [washer removeObserver:accountant];
            [accountant removeObserver:director];
        }
    }
}

#pragma mark -
#pragma mark Private

- (id) findFreeRoomOfClass:(Class)roomClass {
    KSRooms *result = nil;
    
    for (id construction in self.buildings) {
        for (id room in [construction rooms] ) {
            if ([room respondsToSelector:@selector(addCar:)] && ![room isFullOfCars]) {
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

- (id) findFreeEmployee:(Class)class {
    for (id employee in self.staff) {
        if ([employee isMemberOfClass:class] && kKSIsFree == [employee state]) {
            
            return employee;
        }
    }
    
    return nil;
}

@end
