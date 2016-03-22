//
//  KSArrayModel+KSCollectionChangeModel.h
//  KSProjectUI
//
//  Created by Serg Bla on 17.02.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSCollectionChangeModel.h"

@interface KSCollectionChangeModel (KSArrayModel)

+ (instancetype)addModelWithIndex:(NSUInteger)index;
+ (instancetype)removeModelWithIndex:(NSUInteger)index;
+ (instancetype)insertModelWithIndex:(NSUInteger)index;
+ (instancetype)replaceModelWithIndex:(NSUInteger)index;

+ (instancetype)moveModelWithIndex:(NSUInteger)index toIndex:(NSUInteger)toIndex;
+ (instancetype)exchangeModelWithIndex:(NSUInteger)index toIndex:(NSUInteger)toIndex;

@end
