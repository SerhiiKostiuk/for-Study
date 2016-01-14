
#import "KSEmployee.h"

@interface KSEmployee ()
@property (nonatomic, readwrite) NSUInteger moneyAmount;

@end
@implementation KSEmployee


- (void)processObject:(id<KSCashFlowProtocol>)object {
    [self doesNotRecognizeSelector:_cmd];
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