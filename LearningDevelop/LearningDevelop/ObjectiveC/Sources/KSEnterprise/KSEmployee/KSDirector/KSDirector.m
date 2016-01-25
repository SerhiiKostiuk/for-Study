
#import "KSAccountant.h"
#import "KSDirector.h"

@implementation KSDirector

- (void)processObject:(KSAccountant *)accountant {
    [accountant giveMoney:accountant.moneyAmount toReceiver:self];
     NSLog(@"Director's Income is %lu ", self.moneyAmount);
}

- (void)cleanupAfterProcessing {
    @synchronized(self) {
        self.state = kKSEmployeeDidBecomeFree;
    }
}

@end
