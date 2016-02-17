//
//  KSArrayIndexChangeModel.h
//  KSProjectUI
//
//  Created by Serg Bla on 17.02.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSCollectionChangeModel.h"

@interface KSArrayIndexChangeModel : KSCollectionChangeModel
@property (nonatomic, readonly) NSUInteger index;

+ (instancetype)objectWithChangeType:(NSUInteger)changeType index:(NSUInteger)index;

@end