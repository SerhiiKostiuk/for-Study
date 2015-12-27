//
//  car.h
//  LearningDevelop
//
//  Created by Serg Bla on 08.12.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KSCashFlowProtocol.h"

@interface KSCar : NSObject <CashFlowProtocol>

@property (nonatomic, readwrite, assign)                     NSUInteger    wallet;
@property (nonatomic, readwrite, assign, getter = isClean)   BOOL          clean;

+ (instancetype)car;
+ (instancetype)carWithMoney:(NSUInteger)money;

- (instancetype)initWithMoney:(NSUInteger)money;

@end
