//
//  rooms.h
//  LearningDevelop
//
//  Created by Serg Bla on 08.12.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import <Foundation/Foundation.h>

@class containerForItems;

@interface rooms : NSObject
@property (nonatomic, readonly) containerForItems *staff;

+ (instancetype)roomWithCapacity:(NSUInteger)capacity;

+ (BOOL)canContainItemOfClass:(Class)itemClass;

- (instancetype)initWithCapacity:(NSUInteger)capacity;

- (void)addEmployee:(id)employee;
- (void)removeEmployee:(id)employee;

@end
