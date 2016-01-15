
#import <Foundation/Foundation.h>

@protocol KSEmployeeProtocol <NSObject>

@optional
- (void)employeeDidStartWork:(id)employee;
- (void)employeeDidFinishWork:(id)employee;
- (void)employeeDidBecomeFree:(id)employee;

@end
