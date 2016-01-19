//
//  KSController.m
//  LearningDevelop
//
//  Created by Serg Bla on 19.01.16.
//  Copyright © 2016 Serg Bla. All rights reserved.
//

#import "NSObject+KSExtensions.h"
#import "KSController.h"
#import "KSEnterprise.h"
#import "KSCar.h"

static const NSUInteger kKSDefaultTimeInterval = 0.7;
static const NSUInteger kKSDefaultCarsCount = 500;

@interface KSController ()
@property (nonatomic, retain) KSEnterprise *enterprise;
@property (nonatomic, retain) NSTimer      *timer;

@end

@implementation KSController

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.enterprise = nil;
    self.timer = nil;
    
    [super dealloc];
}

- (instancetype)initWithEnterprise {
    self = [super init];
    if (self) {
        self.enterprise = [KSEnterprise object];
    }
    
    return self;
}

- (BOOL)isWorking {
  return nil != self.timer;
}

- (void)setTimer:(NSTimer *)timer {
    if (timer != _timer) {
        [_timer invalidate];
        [_timer release];
        
        _timer = timer;
    }
}

- (void)setWorking:(BOOL)working {
    if (self.working == YES) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:kKSDefaultTimeInterval
                                                      target:self
                                                    selector:@selector(startBackgroundWork)
                                                    userInfo:nil
                                                     repeats:YES];
    } else if (self.working == NO) {
        self.timer = nil;
    }
    
}

- (void)startBackgroundWork {
    [self performSelectorInBackground:@selector(carGenerate) withObject:nil];
}

- (void)carGenerate {
    @autoreleasepool {
        NSArray *cars = [KSCar objectsWithCount:kKSDefaultCarsCount];
        [self.enterprise washCars:cars];
    }
}

@end
