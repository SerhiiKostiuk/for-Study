//
//  KSController.m
//  LearningDevelop
//
//  Created by Serg Bla on 19.01.16.
//  Copyright © 2016 Serg Bla. All rights reserved.
//

#import "KSController.h"
#import "KSEnterprise.h"
#import "KSDispatch.h"
#import "KSCar.h"

static const NSUInteger kKSDefaultTimeInterval = 0.7;
static const NSUInteger kKSDefaultCarsCount    = 5;

@interface KSController ()
@property (nonatomic, retain) KSEnterprise *enterprise;
@property (nonatomic, retain) NSTimer      *timer;

- (void)startBackgroundWork;
- (void)performWorkWithObject:(id)object;

@end

@implementation KSController

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.enterprise = nil;
    self.timer = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.enterprise = [KSEnterprise object];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setTimer:(NSTimer *)timer {
    if (_timer != timer) {
        [_timer invalidate];
        [_timer release];
        
        _timer = [timer retain];
    }
}

- (void)setWorking:(BOOL)working {
    if (_working == working) {
        return;
    }
    
    _working = working;
    if (working) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:kKSDefaultTimeInterval
                                                      target:self
                                                    selector:@selector(startBackgroundWork)
                                                    userInfo:nil
                                                     repeats:YES];
    } else {
        self.timer = nil;
    }
}

#pragma mark-
#pragma mark Private

- (void)startBackgroundWork {
    usleep(50 *500);
    KSDispatchAsyncOnBackgroundQueue(^{
        NSArray *cars = [KSCar objectsWithCount:kKSDefaultCarsCount];
        for (id car in cars) {
            [self performWorkWithObject:car];
        }
    });
}

- (void)performWorkWithObject:(id)object {
    [self.enterprise washCar:object];
}

@end
