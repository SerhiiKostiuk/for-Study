
#import <Foundation/Foundation.h>
#import "KSCashFlowProtocol.h"

@interface KSCar : NSObject <KSCashFlowProtocol>
@property (nonatomic, assign, getter = isClean) BOOL clean;

+ (instancetype)car;

@end