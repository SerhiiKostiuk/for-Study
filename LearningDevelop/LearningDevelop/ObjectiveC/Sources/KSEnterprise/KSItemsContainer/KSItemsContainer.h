//
//  containerForItems.h
//  LearningDevelop
//
//  Created by Serg Bla on 13.12.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KSItemsContainer : NSObject

@property (nonatomic, readonly) NSArray  *items;

- (void)addItem:(id)item;
- (void)removeItem:(id)item;



@end
