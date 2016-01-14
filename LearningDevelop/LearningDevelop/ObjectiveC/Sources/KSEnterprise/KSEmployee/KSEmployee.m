//
//  employee.m
//  LearningDevelop
//
//  Created by Serg Bla on 08.12.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import "KSEmployee.h"
#import "KSQueue.h"

@interface KSEmployee ()
@property (nonatomic, readwrite) NSUInteger moneyAmount;

@end

@implementation KSEmployee

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    
    if (self) {
        self.state = kKSEmployeeDidBecomeFree;
    }
    
    return self;
}

#pragma mark -
#pragma mark Public

- (void)performWorkWithObject:(id<KSCashFlowProtocol>)object {
//    self.state = kKSEmployeeDidStartWork:;
    [self processObject:object];
    [self notifyObserversOnСurrentThread];

}

#pragma mark -
#pragma mark Private

- (void)processObject:(id<KSCashFlowProtocol>)object {
    [self doesNotRecognizeSelector:_cmd];
}

- (void)notifyObserversOnСurrentThread {
    [self notifyObserversWithSelector:[self selectorForState:self.state] withObject:self];
}

- (SEL)selectorForState:(NSUInteger)state {
    switch (state) {
        case kKSEmployeeDidFinishWork:
            return @selector(employeeDidFinishWork:);
        case kKSEmployeeDidBecomeFree:
            return @selector(employeeDidBecomeFree:);
        case kKSEmployeeDidStartWork:
            return @selector(employeeDidStartWork:);
            
        default:
            return NULL;
    }
}

#pragma mark -
#pragma mark CashFlowProtocol

- (void)giveMoney:(NSUInteger)amount toReceiver:(id<KSCashFlowProtocol>)receiver {
    [self giveMoney:amount];
    [receiver takeMoney:amount];
}

- (void)giveMoney:(NSUInteger)amount {
    @synchronized(self) {
        self.moneyAmount -= amount;
    }
}

- (void)takeMoney:(NSUInteger)amount {
    @synchronized(self) {
        self.moneyAmount += amount;
    }
}

@end
