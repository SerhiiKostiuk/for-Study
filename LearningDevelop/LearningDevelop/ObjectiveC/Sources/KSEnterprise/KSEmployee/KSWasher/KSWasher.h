//
//  washer.h
//  LearningDevelop
//
//  Created by Serg Bla on 08.12.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KSEmployee.h"
#import "KSCashFlowProtocol.h"

@class KSCar;

@interface KSWasher :KSEmployee

- (void)performSpecificOperationWithObject:(KSCar *)car;


@end
