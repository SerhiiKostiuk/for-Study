//
//  buildings.h
//  LearningDevelop
//
//  Created by Serg Bla on 12.12.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import <Foundation/Foundation.h>

@class rooms;

@interface buildings : NSObject

@property (nonatomic, readonly) NSArray *rooms;



- (instancetype)initWithRooms:(NSArray *)rooms;
//+ (BOOL)canContainItemOfClass:(Class)itemClass;

- (void)addRoom:(rooms *)room;
- (void)removeRoom:(rooms *)room;

@end
