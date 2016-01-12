//
//  car.m
//  LearningDevelop
//
//  Created by Serg Bla on 08.12.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import "KSCar.h"

static const NSUInteger kKSDefaultWallet = 20;

@interface KSCar ()
@property (nonatomic, readwrite) NSUInteger wallet;

@end

@implementation KSCar

+ (instancetype)car {
    return [[[self alloc] initWithMoney:kKSDefaultWallet]autorelease];
}

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

#pragma mark -
#pragma mark CashFlowProtocol

- (void)giveMoney:(NSUInteger)amount toReceiver:(id<KSCashFlowProtocol>)receiver {
    @synchronized(self) {
        [self giveMoney:amount];
        [receiver takeMoney:amount];
        self.wallet -=amount;
    }
}

- (void)giveMoney:(NSUInteger)amount {
    @synchronized(self) {
        self.wallet -= amount;
    }
}

- (void)takeMoney:(NSUInteger)amount {
    @synchronized(self) {
        self.wallet += amount;
    }
}

@end
