//
//  KSArrayDoubleIndexChangeModel.h
//  KSProjectUI
//
//  Created by Serg Bla on 17.02.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSArrayIndexChangeModel.h"

@interface KSArrayDoubleIndexChangeModel : KSArrayIndexChangeModel
@property (nonatomic, readonly) NSUInteger toIndex;

+ (instancetype)objectWithChangeType:(NSUInteger)changeType index:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex;

@end
