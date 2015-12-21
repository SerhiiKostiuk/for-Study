//
//  buildings.h
//  LearningDevelop
//
//  Created by Serg Bla on 12.12.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import <Foundation/Foundation.h>

@class KSRooms;

@interface KSBuildings : NSObject

@property (nonatomic, readonly) NSArray *rooms;

+ (instancetype)building;
+ (instancetype)buildingWithRooms:(NSArray *)rooms;

//+ (BOOL)canContainItemOfClass:(Class)itemClass;


- (instancetype)initWithRooms:(NSArray *)rooms;

- (void)addRoom:(id)room;
- (void)removeRoom:(id)room;

- (NSArray *)roomsOfClass:(Class)roomClass;

@end
