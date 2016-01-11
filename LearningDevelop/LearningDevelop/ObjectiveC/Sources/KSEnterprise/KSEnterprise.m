
//
//  KSEnterprise.m
//  LearningDevelop
//
//  Created by Serg Bla on 08.12.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import "KSCar.h"
#import "KSQueue.h"
#import "KSWasher.h"
#import "KSDirector.h"
#import "KSEmployee.h"
#import "KSAccountant.h"
#import "KSEnterprise.h"
#import "KSItemsContainer.h"
#import "NSObject+KSExtensions.h"

@interface KSEnterprise () <KSObserverProtocol>

@property (nonatomic, retain) KSItemsContainer    *staffContainer;

@property (nonatomic, retain) KSQueue  *carsQueue;
@property (nonatomic, retain) KSQueue  *washerQueue;
@property (nonatomic, retain) KSQueue  *accountantQueue;

- (void)hireBasicTeam;
- (id)findFreeEmployee:(Class)class;

@end

@implementation KSEnterprise

#pragma mark -
#pragma Class Methods

+ (instancetype)enterprise {
    return [self object];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc
{
    self.staffContainer = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.staffContainer = [KSItemsContainer object];
    }
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)staff {
    return [self.staffContainer items];
}

#pragma mark -
#pragma mark Public

- (void)washCars:(NSArray *)cars {
    [self performSelectorInBackground:@selector(performWorkWithCars:) withObject:cars];
    
}

#pragma mark -
#pragma mark Private


- (void)hireBasicTeam {
    KSItemsContainer *teamContainer = self.staffContainer;
    NSArray *staff = @[[KSWasher object],[KSWasher object],[KSAccountant object],[KSDirector object]];
    
    for (id employee in staff) {
        [employee addObserver:self];
        [teamContainer addItem:employee];
    }
}

- (void)fireBasicTeam {
    NSArray *staff = self.staffContainer.items;
    
    for (id employee in staff) {
        for (id observer in staff) {
            [employee removeObserver:observer];
        }
        [employee removeObserver:self];
    }
    
    self.staffContainer = nil;
}

- (id)findFreeEmployee:(Class)class {
    for (id employee in self.staffContainer.items) {
        if ([employee isMemberOfClass:class] && kKSIsFree == [employee state]) {
            @synchronized(employee) {
                if (kKSIsFree == [employee state]) {
                    [employee setState:kKSIsBusy];
                    
                    return employee;
                }
            }
        }
    }
    
    return nil;
}

- (void)performWorkWithCar:(id<KSCashFlowProtocol>)car {
    @autoreleasepool {
        KSWasher *washer = [self findFreeEmployee:[KSWasher class]];
        if (washer) {
            [washer performWorkWithObject:car];
        } else {
            [self.carsQueue addToQueue:car];
        }
    }
}

- (void)performWorkWithCars:(NSArray *)cars {
    @autoreleasepool {
        for (KSCar *car in cars) {
            [self performWorkWithCar:car];
        }
    }
}



@end
