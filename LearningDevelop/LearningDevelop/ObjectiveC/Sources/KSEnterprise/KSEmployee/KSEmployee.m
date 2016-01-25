
#import "KSEmployee.h"
#import "KSDispatch.h"
#import "KSQueue.h"

@interface KSEmployee ()
@property (nonatomic, readwrite) NSUInteger  moneyAmount;
@property (nonatomic, retain)    KSQueue     *objectsQueue;

- (void)processObject:(id<KSCashFlowProtocol>)object;

@end

@implementation KSEmployee

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.objectsQueue = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.state = kKSEmployeeDidBecomeFree;
        self.objectsQueue = [KSQueue object];
    }
    
    return self;
}

#pragma mark -
#pragma mark Public

- (void)performWorkWithObject:(id<KSCashFlowProtocol>)object {
    KSDispatchAsyncOnQueue(KSDispatchQueueDefault, ^{
        [self processObject:object];
        
        KSDispatchSyncOnMainQueue(^{
            [self completeProcessingObject:object];
            [self cleanupAfterProcessing];
        });
    });
}

- (void)processObject:(id<KSCashFlowProtocol>)object {
    [self doesNotRecognizeSelector:_cmd];
}

- (void)completeProcessingObject:(KSEmployee *)object {
    @synchronized(object) {
        object.state = kKSEmployeeDidBecomeFree;
    }
}

- (void)cleanupAfterProcessing {
    @synchronized(self) {
        self.state = kKSEmployeeDidFinishWork;
    }
}

#pragma mark -
#pragma mark Private

- (SEL)selectorForState:(NSUInteger)state {
    switch (state) {
        case kKSEmployeeDidFinishWork:
            return @selector(employeeDidFinishWork:);
            
        case kKSEmployeeDidBecomeFree:
            return @selector(employeeDidBecomeFree:);
            
        case kKSEmployeeDidStartWork:
            return @selector(employeeDidStartWork:);
            
        default:
            return [super selectorForState:state];
    }
}

#pragma mark -
#pragma mark KSCashFlowProtocol

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