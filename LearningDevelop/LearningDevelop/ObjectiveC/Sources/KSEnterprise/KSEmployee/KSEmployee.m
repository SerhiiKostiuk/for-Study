
#import "KSEmployee.h"

@interface KSEmployee ()
@property (nonatomic, readwrite) NSUInteger moneyAmount;

- (void)processObject:(id<KSCashFlowProtocol>)object;
- (void)finishProcessingObject:(id<KSCashFlowProtocol>)object;
- (void)completeProcessingObject:(id<KSCashFlowProtocol>)object;
- (void)cleanupAfterProcessing;

@end
@implementation KSEmployee

#pragma mark -
#pragma mark Public 

- (void)performWorkWithObject:(id<KSCashFlowProtocol>)object {
    [self processObject:object];
    [self finishProcessingObject:object];
}

#pragma mark -
#pragma mark Private

- (void)processObject:(id<KSCashFlowProtocol>)object {
    [self doesNotRecognizeSelector:_cmd];
}

- (void)finishProcessingObject:(id<KSCashFlowProtocol>)object {
    [self completeProcessingObject:object];
    [self cleanupAfterProcessing];
}

- (void)completeProcessingObject:(KSEmployee *)object {
    object.state = kKSEmployeeDidBecomeFree;
}

- (void)cleanupAfterProcessing {
    self.state = kKSEmployeeDidFinishWork;
}

-(SEL)selectorForState:(NSUInteger)state {
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
#pragma mark KSCashFlowProtocol

- (void)giveMoney:(NSUInteger)amount toReceiver:(id<KSCashFlowProtocol>)receiver {
    [self giveMoney:amount];
    [receiver takeMoney:amount];
}

- (void)giveMoney:(NSUInteger)amount {
    self.moneyAmount -= amount;
}

- (void)takeMoney:(NSUInteger)amount {
    self.moneyAmount += amount;
}

@end