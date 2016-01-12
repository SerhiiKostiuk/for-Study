//
//  CashFlowProtocol.h
//  LearningDevelop
//
//  Created by Serg Bla on 12.12.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol KSCashFlowProtocol

@property (nonatomic, readonly) NSUInteger wallet;

- (void)giveMoney:(NSUInteger)amount toReceiver:(id<KSCashFlowProtocol>)receiver;

- (void)giveMoney:(NSUInteger)amount;
- (void)takeMoney:(NSUInteger)amount;

@end
