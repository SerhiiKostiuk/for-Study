
#import <Foundation/Foundation.h>
#import "KSCashFlowProtocol.h"
#import "KSObservableObject.h"
#import "KSEmployeeProtocol.h"

typedef NS_ENUM (NSUInteger, KSEmployeeState) {
    kKSEmployeeDidBecomeFree,
    kKSEmployeeDidStartWork,
    kKSEmployeeDidFinishWork
};

@interface KSEmployee : KSObservableObject <KSCashFlowProtocol, KSEmployeeProtocol>

- (void)performWorkWithObject:(id<KSCashFlowProtocol>)object;

// Never call this method directly should be overload in subclass
- (void)processObject:(id<KSCashFlowProtocol>)object;

// this methods should be overload in subclass
- (void)completeProcessingObject:(KSEmployee *)object;
- (void)cleanupAfterProcessing;

@end
