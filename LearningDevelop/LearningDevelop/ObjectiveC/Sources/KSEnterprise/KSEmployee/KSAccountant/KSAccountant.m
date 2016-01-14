
#import "KSAccountant.h"
#import "KSWasher.h"
@implementation KSAccountant

- (void)processObject:(KSWasher *)washer {
    [washer giveMoney:washer.moneyAmount toReceiver:self];
}

@end