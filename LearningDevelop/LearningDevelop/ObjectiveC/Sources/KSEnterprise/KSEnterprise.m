
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

@interface KSEnterprise () <KSEmployeeProtocol>

@property (nonatomic, retain) KSItemsContainer    *staffContainer;

@property (nonatomic, retain) KSQueue  *carsQueue;
@property (nonatomic, retain) KSQueue  *washerQueue;
@property (nonatomic, retain) KSQueue  *accountantQueue;

- (void)hireBasicTeam;
- (id)findFreeEmployee:(Class)class;
- (void)performWorkWithCar:(id<KSCashFlowProtocol>)car;
- (void)performWorkWithCars:(NSArray *)cars;

@end

@implementation KSEnterprise

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.carsQueue = nil;
    self.washerQueue = nil;
    self.staffContainer = nil;
    self.accountantQueue = nil;

    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.carsQueue = [KSQueue object];
        self.washerQueue = [KSQueue object];
        self.accountantQueue = [KSQueue object];
        self.staffContainer = [KSItemsContainer object];
        
        [self hireBasicTeam];
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

- (id)findFreeEmployee:(Class)class {
    for (id employee in self.staffContainer.items) {
        if ([employee isMemberOfClass:class] && kKSEmployeeIsFree == [employee state]) {
            @synchronized(employee) {
                if (kKSEmployeeIsFree == [employee state]) {
                    [employee setState:kKSEmployeeIsBusy];
                    
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
            [self.carsQueue enQueue:car];
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

#pragma mark -
#pragma mark KSEmployeeProtocol

- (void)employeeFinishWork:(id)employee {
    if ([employee class] == [KSWasher class]) {
        KSAccountant *accountant = [self findFreeEmployee:[KSAccountant class]];
        [accountant performWorkWithObject:employee];
    } else if ([employee class] == [KSAccountant class]) {
        KSDirector *director = [self findFreeEmployee:[KSDirector class]];
        [director performWorkWithObject:employee];
        
    }
}

@end
