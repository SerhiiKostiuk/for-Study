//
//  washBox.h
//  LearningDevelop
//
//  Created by Serg Bla on 12.12.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import "KSRooms.h"

@class KSCar;
@class KSItemsContainer;

@interface KSWashBox : KSRooms

@property (nonatomic,readonly) KSItemsContainer *cars;

+ (instancetype)roomWithCapacity:(NSUInteger)capacity;

- (instancetype)initWithCapacity:(NSUInteger)capacity;

- (void)addCar:(id)car;
- (void)removeCar:(id)car;

- (BOOL)isFullOfCars;

@end
