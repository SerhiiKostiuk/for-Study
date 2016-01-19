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
static const NSUInteger kKSDefaultCarsCount = 5;

@interface KSController ()
@property (nonatomic, retain) KSEnterprise *enterprise;
@property (nonatomic, retain) NSTimer      *timer;

- (void)startBackgroundWork;
- (void)generateCar;
- (void)performWorkWithObject:(id)object;

@end

@implementation KSController

@dynamic working;

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

//- (void)setWorking:(BOOL)working {
//    if (self.working == YES) {

- (void)startWork {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:kKSDefaultTimeInterval
                                                      target:self
                                                    selector:@selector(startBackgroundWork)
                                                    userInfo:nil
                                                     repeats:YES];
}

//}
//}

//else if (self.working == NO) {

- (void)stopWork {
   self.timer = nil; 
}

//}

#pragma mark-
#pragma mark Private

- (void)startBackgroundWork {
    [self performSelectorInBackground:@selector(generateCar) withObject:nil];
}

- (void)generateCar {
    @autoreleasepool {
        NSArray *cars = [KSCar objectsWithCount:kKSDefaultCarsCount];
        for (id car in cars) {
            [self performWorkWithObject:car];
        }
    }
}

- (void)performWorkWithObject:(id)object {
    [self.enterprise washCar:object];
}

@end
