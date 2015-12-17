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

@property (nonatomic, readonly) NSArray            *buildings;
@property (nonatomic, readonly) KSItemsContainer  *staff;

+ (instancetype)enterprise;
+ (instancetype)enterpriseWithOffice:(KSBuildings *)office carWash:(KSCarWashBuilding *)carWash;

- (instancetype)initWithOffice:(KSBuildings *)office carWash:(KSCarWashBuilding *)carWash;

- (void)addBuilding:(KSBuildings *)building;
- (void)removeBuilding:(KSBuildings *)building;

- (void)hireEmployee:(KSEmployee *)employee;
- (void)fireEmployee:(KSEmployee *)employee;

- (void)defaultSetup;

@end
