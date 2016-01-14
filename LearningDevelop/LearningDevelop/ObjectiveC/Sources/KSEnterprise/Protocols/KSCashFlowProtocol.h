
#import <Foundation/Foundation.h>

@protocol KSCashFlowProtocol

@property (nonatomic, readonly) NSUInteger moneyAmount;

- (void)giveMoney:(NSUInteger)amount toReceiver:(id<KSCashFlowProtocol>)receiver;

- (void)giveMoney:(NSUInteger)amount;
- (void)takeMoney:(NSUInteger)amount;

@end