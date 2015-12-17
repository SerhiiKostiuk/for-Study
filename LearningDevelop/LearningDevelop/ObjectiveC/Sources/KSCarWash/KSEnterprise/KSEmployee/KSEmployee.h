//
//  employee.h
//  LearningDevelop
//
//  Created by Serg Bla on 08.12.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KSCashFlowProtocol.h"

@interface KSEmployee : NSObject <CashFlowProtocol>


@property (nonatomic, readwrite) NSUInteger salary;
@property (nonatomic, readwrite) NSUInteger experience;
@property (nonatomic, readwrite, assign) NSUInteger wallet;
@property (nonatomic, readwrite, getter=isFree) BOOL free;


+ (instancetype)employeeWithSalary:(NSUInteger)salary experience:(NSUInteger)experience;

- (instancetype)initWithSalary:(NSUInteger)salary experience:(NSUInteger)experience;

- (void)performPositionSpecificOperation;

//- (void)takeMoney:(NSUInteger)amount fromSender:(id<CashFlowProtocol>)sender;

@end
