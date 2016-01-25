
#import "KSWasher.h"
#import "KSCar.h"

static const NSUInteger kWashPrice = 10;

@implementation KSWasher

- (void)processObject:(KSCar *)car {
    [car giveMoney:kWashPrice toReceiver:self];
    car.clean = YES;
}

- (void)completeProcessingObject:(id)object {
    
}

@end
