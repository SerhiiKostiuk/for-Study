//
//  KSArrayModel+KSCollectionChangeModel.m
//  KSProjectUI
//
//  Created by Serg Bla on 17.02.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSCollectionChangeModel+KSArrayModel.h"

#import "KSArrayIndexChangeModel.h"
#import "KSArrayDoubleIndexChangeModel.h"

@implementation KSCollectionChangeModel (KSArrayModel)

+ (instancetype)addModelWithIndex:(NSUInteger)index {
    return [KSArrayIndexChangeModel modelWithChangeType:kKSChangeTypeObjectAdded index:index];
}

+ (instancetype)removeModelWithIndex:(NSUInteger)index {
    return [KSArrayIndexChangeModel modelWithChangeType:kKSChangeTypeObjectRemoved index:index];
}

+ (instancetype)insertModelWithIndex:(NSUInteger)index {
    return [KSArrayIndexChangeModel modelWithChangeType:kKSChangeTypeObjectInserted index:index];
}

+ (instancetype)replaceModelWithIndex:(NSUInteger)index {
    return [KSArrayIndexChangeModel modelWithChangeType:kKSChangeTypeObjectReplaced index:index];
}

+ (instancetype)moveModelWithIndex:(NSUInteger)index toIndex:(NSUInteger)toIndex {
    return [KSArrayDoubleIndexChangeModel modelWithChangeType:kKSChangeTypeObjectMoved index:index toIndex:toIndex];

}

+ (instancetype)exchangeModelWithIndex:(NSUInteger)index toIndex:(NSUInteger)toIndex {
    return [KSArrayDoubleIndexChangeModel modelWithChangeType:kKSChangeTypeObjectExchahged index:index toIndex:toIndex];
}

@end
