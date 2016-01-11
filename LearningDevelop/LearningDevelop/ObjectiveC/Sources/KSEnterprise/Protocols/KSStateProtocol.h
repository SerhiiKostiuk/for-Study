//
//  KSObserverProtocol.h
//  LearningDevelop
//
//  Created by Serg Bla on 27.12.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KSCashFlowProtocol.h"

typedef NS_ENUM (NSUInteger, KSEmployeeState) {
    kKSIsFree,
    kKSIsBusy,
    kKSWorkDone
};

@protocol KSStateProtocol <KSCashFlowProtocol>
@property (nonatomic, readonly, assign)   KSEmployeeState state;

- (void)setState:(KSEmployeeState)state;

- (SEL)selectorForState:(KSEmployeeState)state;

@end
