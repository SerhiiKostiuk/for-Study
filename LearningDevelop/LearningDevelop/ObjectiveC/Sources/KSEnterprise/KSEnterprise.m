
//
//  KSEnterprise.m
//  LearningDevelop
//
//  Created by Serg Bla on 08.12.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import "KSCar.h"
#import "CategoryForNSObject.h"
#import "KSEmployee.h"
#import "KSEnterprise.h"
#import "KSItemsContainer.h"
#import "KSWasher.h"
#import "KSAccountant.h"
#import "KSDirector.h"


@interface KSEnterprise ()

@property (nonatomic, readwrite, retain) KSItemsContainer    *staffContainer;
@property (nonatomic, readwrite, retain) KSItemsContainer    *queue;

- (id) findFreeEmployee:(Class)class;

@end

@implementation KSEnterprise
@dynamic staff;

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
    self.queue = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.staffContainer = [KSItemsContainer object];
        self.queue = [KSItemsContainer object];
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

- (void)hireEmployee:(KSEmployee *)employee {
    [self.staffContainer addItems:employee];
}

- (void)fireEmployee:(KSEmployee *)employee {
    [self.staffContainer removeItems:employee];
}

- (void)hireBasicTeam {
    KSWasher *firstWasher = [KSWasher employee];
    KSWasher *secondWasher = [KSWasher employee];
    KSAccountant *accountant = [KSAccountant employee];
    KSDirector *director = [KSDirector employee];
    
    [firstWasher addObserver:accountant];
    [secondWasher addObserver:accountant];
    [accountant addObserver:director];
    
    NSArray *personal = @[firstWasher,secondWasher,accountant,director];
    for (KSEmployee *worker in personal) {
        [self hireEmployee:worker];
    }
}

- (void)washCars:(NSArray *)cars {

    for (KSCar *car in cars) {
        
        [self performBackgroundWashCar:car];
    }
  
}

#pragma mark -
#pragma mark Private

- (id) findFreeEmployee:(Class)class {
    for (id employee in self.staff) {
        if ([employee isMemberOfClass:class] && kKSIsFree == [employee state]) {
            
            return employee;
        }
    }
    
    return nil;
}

- (void)performBackgroundWashCar:(KSCar *)car {
    KSWasher *washer = [self findFreeEmployee:[KSWasher class]];
    if (washer) {
        @synchronized(washer) {
            NSLog(@"Washerman %@ locked", washer);
            if (kKSIsFree == [washer state]) {
                [washer performPositionSpecificOperation:car];
                NSLog(@"Is car clean: %hhd Money is: %lu", car.isClean, car.wallet);
            }
        }
    }
}

@end
