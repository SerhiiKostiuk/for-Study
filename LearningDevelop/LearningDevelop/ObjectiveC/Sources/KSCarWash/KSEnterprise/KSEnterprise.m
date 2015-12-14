//
//  KSEnterprise.m
//  LearningDevelop
//
//  Created by Serg Bla on 08.12.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import "employee.h"
#import "KSEnterprise.h"

@implementation KSEnterprise

+ (instancetype)enterprise;
+ (instancetype)enterpriseWithOffice:(officeBuilding *)office carWash:(carWashBuilding *)carWash;

- (instancetype)initWithOffice:(officeBuilding *)office carWash:(carWashBuilding *)carWash;

- (void)addBuilding:(buildings *)building {
    
}
- (void)removeBuilding:(buildings *)building;

- (void)hireEmployee:(employee *)employee;
- (void)fireEmployee:(employee *)employee; 



@end
