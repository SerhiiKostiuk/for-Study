//
//  employee.m
//  LearningDevelop
//
//  Created by Serg Bla on 08.12.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import "employee.h"

@implementation employee
@synthesize money = _money;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)employeeWithSalary:(NSUInteger)salary experience:(NSUInteger)experience {
    return [[[self alloc] initWithSalary:salary experience:experience] autorelease];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithSalary:(NSUInteger)salary experience:(NSUInteger)experience {
    self = [super init];
    
    if (self) {
        self.salary = salary;
        self.experience = experience;
    }
    
    return self;
}

#pragma mark -
#pragma mark Public Implementations

- (void)performPositionSpecificOperation {
    
}

#pragma mark -
#pragma mark CashFlowProtocol

- (void)giveMoney:(NSUInteger)amount toReciver:(id<CashFlowProtocol>)reciver {
    if (reciver) {
        self.money -= amount;
        reciver.money += amount;
    }
}

@end
