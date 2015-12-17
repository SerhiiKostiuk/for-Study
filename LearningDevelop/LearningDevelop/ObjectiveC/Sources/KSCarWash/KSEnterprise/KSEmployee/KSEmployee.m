//
//  employee.m
//  LearningDevelop
//
//  Created by Serg Bla on 08.12.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import "KSEmployee.h"

@implementation KSEmployee


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

-(BOOL)isFree {
    return self.free;
}

- (BOOL) isAbleToPay:(NSUInteger)amount {
    if (self.wallet > amount) {
        return YES;
    }
    return NO;
}

#pragma mark -
#pragma mark CashFlowProtocol

- (void)takeMoney:(NSUInteger)amount fromSender:(id<CashFlowProtocol>)sender {
    if (sender) {
        sender.wallet -= amount;
        self.wallet += amount;
    }
}

@end
