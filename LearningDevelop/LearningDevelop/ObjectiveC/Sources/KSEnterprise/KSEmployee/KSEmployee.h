
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

@end