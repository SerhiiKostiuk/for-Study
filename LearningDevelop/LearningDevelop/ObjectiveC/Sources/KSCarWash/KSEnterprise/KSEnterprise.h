//
//  KSEnterprise.h
//  LearningDevelop
//
//  Created by Serg Bla on 08.12.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import <Foundation/Foundation.h>
@class buildings;
@class officeBuilding;

@class carWashBuilding;

@interface KSEnterprise : NSObject


+ (instancetype)enterprise;
+ (instancetype)enterpriseWithOffice:(officeBuilding *)office carWash:(carWashBuilding *)carWash;

- (instancetype)initWithOffice:(officeBuilding *)office carWash:(carWashBuilding *)carWash;

- (void)addBuilding:(buildings *)building;
- (void)removeBuilding:(buildings *)building;

- (void)hireEmployee:(employee *)employee;
- (void)fireEmployee:(employee *)employee;








@end
