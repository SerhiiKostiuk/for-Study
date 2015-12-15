//
//  CashFlowProtocol.h
//  LearningDevelop
//
//  Created by Serg Bla on 12.12.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CashFlowProtocol

@property (nonatomic) NSUInteger money;

- (void)giveMoney:(NSUInteger)amount toReciver:(id<CashFlowProtocol>)reciver;
//- (BOOL)takeMoney:(NSUInteger)amount fromSender:(id<CashFlow>)sender;

@end
