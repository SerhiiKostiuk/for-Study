//
//  car.h
//  LearningDevelop
//
//  Created by Serg Bla on 08.12.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CashFlowProtocol.h"

@interface car : NSObject <CashFlowProtocol>

@property (nonatomic, readonly)                   NSUInteger    wallet;
@property (nonatomic, assign, getter = isClean)   BOOL          clean;

+ (instancetype)carWithMoney:(NSUInteger)money;

- (instancetype)initWithMoney:(NSUInteger)money;

@end
