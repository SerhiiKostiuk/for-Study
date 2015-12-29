//
//  employee.m
//  LearningDevelop
//
//  Created by Serg Bla on 08.12.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import "KSEmployee.h"

static const NSUInteger kKSDefaultSalary = 20;
static const NSUInteger kKSDefaultExperience = 1;

@interface KSEmployee ()

@property (nonatomic, readwrite, assign) KSEmployeeState  state;
@property (nonatomic, readwrite, assign) id object;

@end
@implementation KSEmployee
@synthesize state = _state;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)employee {
    return [self employeeWithSalary:kKSDefaultSalary experience:kKSDefaultExperience];
}

+ (instancetype)employeeWithSalary:(NSUInteger)salary experience:(NSUInteger)experience {
    return [[[self alloc] initWithSalary:salary experience:experience] autorelease];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    return [self initWithSalary:kKSDefaultSalary experience:kKSDefaultExperience] ;
}

- (instancetype)initWithSalary:(NSUInteger)salary experience:(NSUInteger)experience {
    self = [super init];
    
    if (self) {
        self.salary = salary;
        self.experience = experience;
    }
    
    return self;
}

#pragma mark -
#pragma mark Public

- (void)performAsyncWorkWithObject:(id<CashFlowProtocol>)object {
    [self performSelectorInBackground:@selector(performPositionSpecificOperation:) withObject:object];
}

#pragma mark -
#pragma mark Private

- (void)performPositionSpecificOperation:(id<CashFlowProtocol>)object {
    [self doesNotRecognizeSelector:_cmd];
}

- (void) onStateDidChange:(KSEmployee *)sender {
    [self notifyObserversWithSelector:[self selectorForState:sender.state] withObject:sender];
}
#pragma mark -
#pragma mark CashFlowProtocol

- (void)takeMoney:(NSUInteger)amount fromSender:(id<CashFlowProtocol>)sender {
    if (sender) {
        
        sender.wallet -= amount;
        self.wallet += amount;
    }
}

- (BOOL)isAbleToPay:(NSUInteger)amount {
    if (self.wallet > amount) {
        return YES;
    }
    return NO;
}

#pragma mark -
#pragma mark KSStateProtocol

- (void)setState:(KSEmployeeState)state {
    if (_state != state) {
        _state = state;
        [self performSelectorOnMainThread:@selector(onStateDidChange:) withObject:self waitUntilDone:NO];
    }
}

- (SEL)selectorForState:(KSEmployeeState)state {
    [self doesNotRecognizeSelector:_cmd];
    
    return Nil;
}

@end
