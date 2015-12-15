//
//  KSEnterprise.m
//  LearningDevelop
//
//  Created by Serg Bla on 08.12.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import "employee.h"
#import "buildings.h"
#import "KSEnterprise.h"
#import "containerForItems.h"

@interface KSEnterprise ()

@property (nonatomic, retain) NSMutableArray     *mutableBuildings;
@property (nonatomic, retain) containerForItems  *staffContainer;

@end

@implementation KSEnterprise
@dynamic buildings;

#pragma mark -
#pragma Class Methods

+ (instancetype)enterprise {
    return [[self alloc] initWithOffice:[buildings building] carWash:[carWashBuilding building]];
}

+ (instancetype)enterpriseWithOffice:(buildings *)office carWash:(carWashBuilding *)carWash {
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
        self.mutableBuildings = [NSMutableArray array];
    }
    return self;
}

- (instancetype)initWithOffice:(buildings *)office carWash:(carWashBuilding *)carWash {
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
    return [[_mutableBuildings copy] autorelease];
}

#pragma mark -
#pragma mark Public

- (void)addBuilding:(buildings *)building {
    [_mutableBuildings addObject:building];
}

- (void)removeBuilding:(buildings *)building {
    [_mutableBuildings removeObject:building];
}

- (void)hireEmployee:(employee *)employee {
    [self.staffContainer addItems:employee];
}
- (void)fireEmployee:(employee *)employee {
    [self.staffContainer removeItems:employee];
}



@end
