//
//  KSEmployeeProtocol.h
//  LearningDevelop
//
//  Created by Serg Bla on 11.01.16.
//  Copyright © 2016 Serg Bla. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol KSEmployeeProtocol <NSObject>

@optional
- (void)employeeDidStartWork:(id)employee;
- (void)employeeDidFinishWork:(id)employee;
- (void)employeeDidBecomeFree:(id)employee;

@end
