//
//  employee.h
//  LearningDevelop
//
//  Created by Serg Bla on 08.12.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KSCashFlowProtocol.h"
#import "KSObservableObject.h"
#import "KSEmployeeProtocol.h"

typedef NS_ENUM (NSUInteger, KSEmployeeState) {
    kKSEmployeeDidBecomeFree,
    kKSEmployeeDidStartWork,
    kKSEmployeeDidFinishWork
};

@interface KSEmployee : KSObservableObject <KSCashFlowProtocol>

- (void)performWorkWithObject:(id<KSCashFlowProtocol>)object;

@end
