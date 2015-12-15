//
//  employee.h
//  LearningDevelop
//
//  Created by Serg Bla on 08.12.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CashFlowProtocol.h"
@interface employee : NSObject <CashFlowProtocol>

@property (nonatomic, readwrite) NSUInteger salary;
@property (nonatomic, readwrite) NSUInteger experience;

+ (instancetype)employeeWithSalary:(NSUInteger)salary experience:(NSUInteger)experience;

- (instancetype)initWithSalary:(NSUInteger)salary experience:(NSUInteger)experience;

- (void)performPositionSpecificOperation;

@end
