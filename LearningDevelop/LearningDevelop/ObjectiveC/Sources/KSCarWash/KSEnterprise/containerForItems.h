//
//  containerForItems.h
//  LearningDevelop
//
//  Created by Serg Bla on 13.12.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface containerForItems : NSObject

@property (nonatomic, readonly) NSArray     *items;
@property (nonatomic, readonly) BOOL        isFull;
@property (nonatomic, assign)   NSUInteger  capacity;

- (instancetype)initWithCapacity:(NSUInteger)capacity;

- (void)addItems:(id)item;
- (void)removeItems:(id)item;



@end
