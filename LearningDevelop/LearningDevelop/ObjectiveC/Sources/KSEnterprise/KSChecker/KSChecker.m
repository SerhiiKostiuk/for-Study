//
//  KSChecker.m
//  LearningDevelop
//
//  Created by Serg Bla on 29.12.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import "CategoryForNSObject.h"
#import "KSItemsContainer.h"
#import "KSEnterprise.h"
#import "KSChecker.h"
#import "KSWasher.h"
#import "KSCar.h"

@interface KSChecker ()

@property (nonatomic, readwrite, assign) KSEnterprise      *enterprise;
@property (nonatomic, readwrite, retain) KSItemsContainer  *queue;

- (id) findFreeEmployee:(Class)class;

@end
@implementation KSChecker

#pragma mark -
#pragma mark Class Methods

+ (instancetype)checkerWithEnterprise:(KSEnterprise *)enterprise {
    return [[[self alloc] initWithEnterprise:enterprise] autorelease];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.queue = nil;
    self.enterprise = nil;
    
    [super dealloc];
}


- (instancetype)initWithEnterprise:(KSEnterprise *)enterprise {
    self = [super init];
    if (self) {
        self.queue = [KSItemsContainer object];
        self.enterprise = enterprise;
    }
    return self;
}



#pragma mark -
#pragma mark Public


- (void)performWorkWithObject:(KSCar *)car {
        [self performSelectorInBackground:@selector(performBackgroundWashCar:) withObject:car];
}

- (void)performWorkWithObjects:(NSArray *)cars {
    @autoreleasepool {
        for (KSCar *car in cars) {
            [self performWorkWithObject:car];
        }
    }
}

#pragma mark -
#pragma mark Private

- (void)performBackgroundWashCar:(KSCar *)car {
    @autoreleasepool {
        KSWasher *washer = [self findFreeEmployee:[KSWasher class]];
        if (washer) {
            @synchronized(washer) {
                if (kKSIsFree == [washer state]) {
                    [washer start];
                    
                    NSLog(@"Is car clean: %hhd Money is: %lu", car.isClean, car.wallet);
                } else {
                    [self.queue addItems:car];
                }
            }
        } else {
            [self.queue addItems:car];
        }
    }
}

- (id) findFreeEmployee:(Class)class {
    NSArray *staff = [self.enterprise staff];
    
    @synchronized(staff) {
        for (id employee in staff) {
            if ([employee isMemberOfClass:class] && kKSIsFree == [employee state]) {
                
                return employee;
            }
        }
    }
    return nil;
}


@end
