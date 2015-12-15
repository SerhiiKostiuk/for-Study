//
//  washBox.h
//  LearningDevelop
//
//  Created by Serg Bla on 12.12.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import "rooms.h"

@class car;
@class containerForItems;

@interface washBox : rooms

@property (nonatomic,readonly) containerForItems *cars;

+ (BOOL)canContainItemOfClass:(Class)itemClass;

- (instancetype)initWithCapacity:(NSUInteger)capacity;

- (void)addCar:(id)car;
- (void)removeCar:(id)car;

@end
