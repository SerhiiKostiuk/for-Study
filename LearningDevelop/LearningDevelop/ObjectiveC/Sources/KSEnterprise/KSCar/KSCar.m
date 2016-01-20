
#import "KSCar.h"

static const NSUInteger kKSDefaultMoneyAmount = 20;

@interface KSCar ()
@property (nonatomic, readwrite) NSUInteger moneyAmount;

@end

@implementation KSCar

#pragma mark - 
#pragma mark Initializations and Deallocations

+ (instancetype)car {
    return [self object];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.moneyAmount = kKSDefaultMoneyAmount;
    }
    
    return self;
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