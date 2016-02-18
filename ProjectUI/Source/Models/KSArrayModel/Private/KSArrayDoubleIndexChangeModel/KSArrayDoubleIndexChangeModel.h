//
//  KSArrayDoubleIndexChangeModel.h
//  KSProjectUI
//
//  Created by Serg Bla on 17.02.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSArrayIndexChangeModel.h"

typedef NS_ENUM(NSUInteger, KSArrayDoubleIndexChangeType) {
    kKSChangeTypeObjectExchahged,
    kKSChangeTypeObjectMoved
};

@interface KSArrayDoubleIndexChangeModel : KSArrayIndexChangeModel
@property (nonatomic, readonly) NSUInteger toIndex;

+ (instancetype)modelWithChangeType:(NSUInteger)changeType index:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex;

@end
