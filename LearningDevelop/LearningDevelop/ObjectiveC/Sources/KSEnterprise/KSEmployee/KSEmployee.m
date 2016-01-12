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
@property (nonatomic, readwrite) NSUInteger wallet;
@property (nonatomic, readwrite) KSQueue    *mutableObjectsQueue;

@end

@implementation KSEmployee

@synthesize state = _state;

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    
    if (self) {
        self.state = kKSEmployeeIsFree;
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)objectsQueue {
    return [[self.mutableObjectsQueue copy] autorelease];
}

#pragma mark -
#pragma mark Public

- (void)performWorkWithObject:(id<KSCashFlowProtocol>)object {
    self.state = kKSEmployeeIsBusy;
//    [self processObject:object];
    [self performSelector:@selector(processObject:) withObject:object];
}

#pragma mark -
#pragma mark Private

- (void)processObject:(id<KSCashFlowProtocol>)object {
    [self doesNotRecognizeSelector:_cmd];
}

//- (void)onStateDidChange {
//    [self performSelectorOnMainThread:@selector(notifyObserversOnMainThread) withObject:nil waitUntilDone:YES];
//    
//}

- (void)notifyObserversOnMainThread {
    [self notifyObserversWithSelector:[self selectorForState:self.state] withObject:self];
}

#pragma mark -
#pragma mark CashFlowProtocol

- (void)giveMoney:(NSUInteger)amount toReceiver:(id<KSCashFlowProtocol>)receiver {
    @synchronized(self) {
        [self giveMoney:amount];
        [receiver takeMoney:amount];
    }
}

- (void)giveMoney:(NSUInteger)amount {
    @synchronized(self) {
        self.wallet -= amount;
    }
}

- (void)takeMoney:(NSUInteger)amount {
    @synchronized(self) {
        self.wallet += amount;
    }
}

#pragma mark -
#pragma mark KSStateProtocol

- (void)setState:(NSUInteger)state {
    if (_state != state) {
        _state = state;
        
//        [self onStateDidChange];
        [self notifyObserversOnMainThread];
    }
}

- (SEL)selectorForState:(NSUInteger)state {
    switch (state) {
        case kKSEmployeeWorkDone:
            return @selector(employeeFinishWork:);
        case kKSEmployeeIsFree:
            return @selector(employeeBecomeFree:);
        case kKSEmployeeIsBusy:
            return @selector(employeeStartWorking:);
            
        default:
            return NULL;
    }
}

@end
