//
//  KSEnterprise.h
//  LearningDevelop
//
//  Created by Serg Bla on 08.12.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import <Foundation/Foundation.h>

@class rooms;
@interface KSEnterprise : NSObject
@property (nonatomic, readonly) NSSet *rooms;
@property (nonatomic, readonly) NSSet *items;

+ (BOOL)canContainItemOfClass:(Class)itemClass;

- (void)addRoom:(rooms *)room;
- (void)removeRoom:(rooms *)room;

- (void)addItem:(id)item;
- (void)removeItem:(id)item;


@end
