//
//  KSEnterprise.h
//  LearningDevelop
//
//  Created by Serg Bla on 08.12.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import <Foundation/Foundation.h>
@class KSBuildings;
@class KSEmployee;
@class KSCarWashBuilding;
@class KSItemsContainer;

@interface KSEnterprise : NSObject

@property (nonatomic, readonly) NSArray    *buildings;
@property (nonatomic, readonly) NSArray    *staff;

+ (instancetype)enterprise;
+ (instancetype)enterpriseWithOffice:(KSBuildings *)office carWash:(KSBuildings *)carWash;

- (instancetype)initWithOffice:(KSBuildings *)office carWash:(KSBuildings *)carWash;

- (void)addBuilding:(KSBuildings *)building;
- (void)removeBuilding:(KSBuildings *)building;

- (void)hireEmployee:(KSEmployee *)employee;
- (void)fireEmployee:(KSEmployee *)employee;

- (void)washCars:(NSArray *)cars;

@end
