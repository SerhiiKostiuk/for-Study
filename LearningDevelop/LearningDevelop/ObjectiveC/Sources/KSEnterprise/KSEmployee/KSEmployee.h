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
#import "KSObserverProtocol.h"
#import "KSStateProtocol.h"

@interface KSEmployee : KSObservableObject <KSCashFlowProtocol, KSStateProtocol, KSObserverProtocol>

- (void)performWorkWithObject:(id<KSCashFlowProtocol>)object;

@end
