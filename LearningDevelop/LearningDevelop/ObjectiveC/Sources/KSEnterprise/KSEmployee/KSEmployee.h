//
//  employee.h
//  LearningDevelop
//
//  Created by Serg Bla on 08.12.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KSCashFlowProtocol.h"
#import "KSObservableObject.h"
#import "KSObserverProtocol.h"

typedef NS_ENUM (NSUInteger, KSEmployeeState) {
    kKSIsFree,
    kKSIsBusy,
    kKSWorkDone
};

@interface KSEmployee : KSObservableObject <CashFlowProtocol, KSObserverProtocol>

@property (nonatomic, assign)   NSUInteger      salary;
@property (nonatomic, assign)   NSUInteger      experience;
@property (nonatomic, assign)   NSUInteger      wallet;
@property (nonatomic, assign)   KSEmployeeState state;

+ (instancetype)employee;

+ (instancetype)employeeWithSalary:(NSUInteger)salary experience:(NSUInteger)experience;

- (instancetype)initWithSalary:(NSUInteger)salary experience:(NSUInteger)experience;


@end
