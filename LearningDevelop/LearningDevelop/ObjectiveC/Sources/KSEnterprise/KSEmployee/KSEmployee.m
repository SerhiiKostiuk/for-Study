//
//  employee.m
//  LearningDevelop
//
//  Created by Serg Bla on 08.12.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import "KSEmployee.h"

@interface KSEmployee ()
@property (nonatomic, readwrite) NSUInteger wallet;

@end

@implementation KSEmployee

@synthesize state = _state;

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    
    if (self) {
        self.state = kKSIsFree;
    }
    
    return self;
}

#pragma mark -
#pragma mark Public

- (void)performWorkWithObject:(id<KSCashFlowProtocol>)object {
    [self performSelectorInBackground:@selector(performSpecificOperationWithObject:) withObject:object];
}

#pragma mark -
#pragma mark Private

- (void)performSpecificOperationWithObject:(id<KSCashFlowProtocol>)object {
    [self doesNotRecognizeSelector:_cmd];
}

- (void)onStateDidChange {
    [self performSelectorOnMainThread:@selector(notifyObserversOnMainThread) withObject:nil waitUntilDone:YES];
    
}

- (void)notifyObserversOnMainThread {
    [self notifyObserversWithSelector:[self selectorForState:self.state] withObject:self];
}

#pragma mark -
#pragma mark CashFlowProtocol

- (void)giveMoney:(NSUInteger)amount toReceiver:(id<KSCashFlowProtocol>)receiver {
    @synchronized(self) {
        if ([self isAbleToPay:amount]) {
            [receiver takeMoney:amount];
            self.wallet -=amount;
        }
    }
}

- (void)takeMoney:(NSUInteger)amount {
    @synchronized(self) {
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
        
        [self onStateDidChange];
    }
}

- (SEL)selectorForState:(KSEmployeeState)state {
    switch (state) {
        case kKSWorkDone:
            return @selector(employeeFinishWork:);
        case kKSIsFree:
            return @selector(employeeBecomeFree:);
        case kKSIsBusy:
            return @selector(employeeStartWorking:);
            
        default:
            return NULL;
    }
}

@end
