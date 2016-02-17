//
//  KSArrayModel+KSCollectionChangeModel.h
//  KSProjectUI
//
//  Created by Serg Bla on 17.02.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSArrayModel.h"

@interface KSArrayModel (KSCollectionChangeModel)

+ (instancetype)addModelWithIndex:(NSUInteger)index;

+ (instancetype)moveModelWithIndex:(NSUInteger)index toIndex:(NSUInteger)toIndex;

@end
