//
//  CashFlowProtocol.h
//  LearningDevelop
//
//  Created by Serg Bla on 12.12.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CashFlowProtocol

@property (nonatomic, readwrite, assign) NSUInteger wallet;

- (void)takeMoney:(NSUInteger)amount fromSender:(id<CashFlowProtocol>)sender;

- (BOOL) isAbleToPay:(NSUInteger)amount;

@end
