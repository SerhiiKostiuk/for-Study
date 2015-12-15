//
//  washer.h
//  LearningDevelop
//
//  Created by Serg Bla on 08.12.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "employee.h"
#import "CashFlowProtocol.h"
@class washBox;

@interface washer :employee <CashFlowProtocol>
@property (nonatomic, readonly, getter=isWasherFree) BOOL washerFree;

- (void)performPositionSpecificOperation:(washBox *)carsWashBox;

@end
