//
//  car.m
//  LearningDevelop
//
//  Created by Serg Bla on 08.12.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import "car.h"

@interface car ()
@property (nonatomic, readwrite, assign) NSUInteger changeableWallet;

@end

@implementation car

@synthesize money = _money;
@dynamic wallet;

+ (instancetype)carWithMoney:(NSUInteger)money {
    return [[[self alloc] initWithMoney:money] autorelease];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithMoney:(NSUInteger)money {
    self = [self init];
    
    if (self) {
        self.changeableWallet = money;
    }
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSUInteger) wallet {
    return self.changeableWallet;
}

#pragma mark -
#pragma mark CashFlowProtocol

- (void)giveMoney:(NSUInteger)amount toReciver:(id<CashFlowProtocol>)reciver {
    if (reciver) {
        self.money -= amount;
        reciver.money += amount;
    }
}

@end
