//
//  employee.h
//  LearningDevelop
//
//  Created by Serg Bla on 08.12.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KSCashFlowProtocol.h"

typedef NS_ENUM (NSUInteger, KSEmployeeState) {
    kKSIsFree,
    kKSIsBusy
};


@interface KSEmployee : NSObject <CashFlowProtocol>


@property (nonatomic, assign)   NSUInteger      salary;
@property (nonatomic, assign)   NSUInteger      experience;
@property (nonatomic, assign)   NSUInteger      wallet;
@property (nonatomic, assign)   KSEmployeeState state;

//@property (nonatomic, readwrite, getter=isFree) BOOL free;


+ (instancetype)employeeWithSalary:(NSUInteger)salary experience:(NSUInteger)experience;

- (instancetype)initWithSalary:(NSUInteger)salary experience:(NSUInteger)experience;

- (void)performPositionSpecificOperation;

//- (void)takeMoney:(NSUInteger)amount fromSender:(id<CashFlowProtocol>)sender;

@end
