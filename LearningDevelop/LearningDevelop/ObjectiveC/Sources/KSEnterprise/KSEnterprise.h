//
//  KSEnterprise.h
//  LearningDevelop
//
//  Created by Serg Bla on 08.12.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import <Foundation/Foundation.h>
@class KSEmployee;
@class KSItemsContainer;

@interface KSEnterprise : NSObject

@property (nonatomic, readonly) NSArray    *staff;

+ (instancetype)enterprise;

- (void)hireBasicTeam;
- (void)hireEmployee:(KSEmployee *)employee;
- (void)fireEmployee:(KSEmployee *)employee;

- (void)washCars:(NSArray *)cars;

@end
