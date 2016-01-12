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
#import "KSStateProtocol.h"

@interface KSEmployee : KSObservableObject <KSCashFlowProtocol, KSStateProtocol, KSEmployeeProtocol>
@property (nonatomic, readonly) NSArray *objectsQueue;

- (void)performWorkWithObject:(id<KSCashFlowProtocol>)object;

@end
