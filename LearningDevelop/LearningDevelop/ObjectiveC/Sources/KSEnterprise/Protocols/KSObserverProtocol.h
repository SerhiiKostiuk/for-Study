//
//  KSObserverProtocol.h
//  LearningDevelop
//
//  Created by Serg Bla on 11.01.16.
//  Copyright © 2016 Serg Bla. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol KSObserverProtocol <NSObject>

@optional
- (void)employeeStartWorking:(id)employee;
- (void)employeeFinishWork:(id)employee;
- (void)employeeBecomeFree:(id)employee;

@end
