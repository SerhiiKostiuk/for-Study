//
//  car.m
//  LearningDevelop
//
//  Created by Serg Bla on 08.12.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import "KSCar.h"

@implementation KSCar

+ (instancetype)carWithMoney:(NSUInteger)money {
    return [[[self alloc] initWithMoney:money] autorelease];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithMoney:(NSUInteger)money {
    self = [super init];
    
    if (self) {
        self.wallet = money;
    }
    return self;
}

- (BOOL) isAbleToPay:(NSUInteger)amount {
    if (self.wallet > amount) {
        return YES;
    }
    return NO;
}

#pragma mark -
#pragma mark CashFlowProtocol

- (void)takeMoney:(NSUInteger)amount fromSender:(id<CashFlowProtocol>)sender {
    if (sender && [self isAbleToPay:amount] ) {
        sender.wallet -= amount;
        self.wallet += amount;
    }
}

@end
