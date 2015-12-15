//
//  KSEnterprise.h
//  LearningDevelop
//
//  Created by Serg Bla on 08.12.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import <Foundation/Foundation.h>
@class buildings;

@class carWashBuilding;
@class containerForItems;

@interface KSEnterprise : NSObject

@property (nonatomic, readonly) NSArray            *buildings;
@property (nonatomic, readonly) containerForItems  *staff;

+ (instancetype)enterprise;
+ (instancetype)enterpriseWithOffice:(buildings *)office carWash:(carWashBuilding *)carWash;

- (instancetype)initWithOffice:(buildings *)office carWash:(carWashBuilding *)carWash;

- (void)addBuilding:(buildings *)building;
- (void)removeBuilding:(buildings *)building;

- (void)hireEmployee:(employee *)employee;
- (void)fireEmployee:(employee *)employee;








@end
