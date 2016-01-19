
#import <Foundation/Foundation.h>

@class KSCar;

@interface KSEnterprise : NSObject

@property (nonatomic, readonly) NSArray *staff;

- (void)washCars:(NSArray *)cars;
- (void)washCar:(KSCar *)car;

@end