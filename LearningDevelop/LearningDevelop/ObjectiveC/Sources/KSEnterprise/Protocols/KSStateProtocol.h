//
//  KSEmployeeProtocol.h
//  LearningDevelop
//
//  Created by Serg Bla on 27.12.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KSCashFlowProtocol.h"

typedef NS_ENUM (NSUInteger, KSEmployeeState) {
    kKSEmployeeIsFree,
    kKSEmployeeIsBusy,
    kKSEmployeeWorkDone
};

@protocol KSStateProtocol <KSCashFlowProtocol>
@property (nonatomic, readonly, assign)   NSUInteger state;

- (void)setState:(NSUInteger)state;

- (SEL)selectorForState:(NSUInteger)state;

@end
