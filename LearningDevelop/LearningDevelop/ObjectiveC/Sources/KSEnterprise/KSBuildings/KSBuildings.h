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

+ (instancetype)building; //delete
+ (instancetype)buildingWithRooms:(NSArray *)rooms;

- (instancetype)initWithRooms:(NSArray *)rooms;

- (void)addRoom:(id)room;
- (void)removeRoom:(id)room;

- (NSArray *)roomsOfClass:(Class)roomClass;

@end
