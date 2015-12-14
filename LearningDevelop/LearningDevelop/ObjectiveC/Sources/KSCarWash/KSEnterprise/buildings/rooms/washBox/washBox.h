//
//  washBox.h
//  LearningDevelop
//
//  Created by Serg Bla on 12.12.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import "rooms.h"

@class car;

@interface washBox : rooms

@property (nonatomic,readonly) NSArray *cars;

- (instancetype)initWithCars:(NSArray *)cars carsCapacity:(NSUInteger)carsCapacity;

- (void)addCar:(car *)car;
- (void)removeCar:(car *)car;

@end
