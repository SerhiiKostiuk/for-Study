
#import "NSObject+KSExtensions.h"
#import "KSEmployee.h"
#import "KSQueue.h"

@interface KSEmployee ()
@property (nonatomic, readwrite) NSUInteger  moneyAmount;
@property (nonatomic, retain)    KSQueue     *objectsQueue;

- (void)performBackgroundWorkWithObject:(id)object;
- (void)processObject:(id<KSCashFlowProtocol>)object;
- (void)finishProcessingObject:(id<KSCashFlowProtocol>)object;


@end

@implementation KSEmployee

#pragma mark-
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
    @synchronized(self) {
        if (kKSEmployeeDidBecomeFree == self.state) {
            self.state = kKSEmployeeDidStartWork;
            [self performSelectorInBackground:@selector(performBackgroundWorkWithObject:) withObject:object];
        } else {
            [self.objectsQueue enqueue:object];
        }
    }
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

- (void)performBackgroundWorkWithObject:(id)object {
    @synchronized(self) {
        [self processObject:object];
        [self finishProcessingObject:object];
    }
}

- (void)processObject:(id<KSCashFlowProtocol>)object {
    [self doesNotRecognizeSelector:_cmd];
}

- (void)finishProcessingObject:(KSEmployee *)object {
    [self completeProcessingObject:object];
    [self processObjectQueue];
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
            return [super selectorForState:state];
    }
}

- (void)processObjectQueue {
    id object = [self.objectsQueue dequeue];
    @synchronized(object) {
        if (object) {
            [self performSelectorInBackground:@selector(performBackgroundWorkWithObject:) withObject:object];
        } else {
            [self cleanupAfterProcessing];
        }
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

#pragma mark -
#pragma mark KSEmployeeProtocol

- (void)employeeDidFinishWork:(KSEmployee *)employee {
    [self performBackgroundWorkWithObject:employee];
    
}

@end