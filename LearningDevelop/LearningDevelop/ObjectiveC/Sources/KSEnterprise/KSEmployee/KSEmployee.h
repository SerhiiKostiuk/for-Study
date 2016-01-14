
#import <Foundation/Foundation.h>
#import "KSCashFlowProtocol.h"

@interface KSEmployee : NSObject <KSCashFlowProtocol>

- (void)processObject:(id<KSCashFlowProtocol>)object;

@end