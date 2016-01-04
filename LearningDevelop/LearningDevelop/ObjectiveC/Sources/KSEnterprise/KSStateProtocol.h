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

@protocol KSStateProtocol <CashFlowProtocol>
@property (nonatomic, readonly) id object;

@property (nonatomic, readonly, assign)   KSEmployeeState state;

- (void)setState:(KSEmployeeState)state;

- (SEL)selectorForState:(KSEmployeeState)state;

- (void)start;
- (void)finish;
- (void)becomeFree;


//- (void)performPositionSpecificOperation:(id<CashFlowProtocol>)object;

@end
