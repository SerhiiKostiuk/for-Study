//
//  KSArrayModel+KSCollectionChangeModel.m
//  KSProjectUI
//
//  Created by Serg Bla on 17.02.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSArrayModel+KSCollectionChangeModel.h"

#import "KSArrayIndexChangeModel.h"
#import "KSArrayDoubleIndexChangeModel.h"

@implementation KSArrayModel (KSCollectionChangeModel)

+ (instancetype)addModelWithIndex:(NSUInteger)index {
    return [KSArrayIndexChangeModel objectWithChangeType:kKSChangeTypeObjectAdded index:index];
}

+ (instancetype)moveModelWithIndex:(NSUInteger)index toIndex:(NSUInteger)toIndex {
    return [KSArrayDoubleIndexChangeModel objectWithChangeType:kKSChangeTypeObjectMoved index:index toIndex:toIndex];

}

@end
