//
//  KSArrayDoubleIndexChangeModel.m
//  KSProjectUI
//
//  Created by Serg Bla on 17.02.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSArrayDoubleIndexChangeModel.h"

@interface KSArrayDoubleIndexChangeModel ()
@property (nonatomic, assign) NSUInteger toIndex;

@end

@implementation KSArrayDoubleIndexChangeModel

#pragma mark -
#pragma mark Public

+ (instancetype)objectWithChangeType:(NSUInteger)changeType index:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex {
    KSArrayDoubleIndexChangeModel *object = [super objectWithChangeType:changeType index:fromIndex];
    object.toIndex = toIndex;
    
    return object;
}

@end
