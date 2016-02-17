//
//  KSArrayIndexChangeModel.m
//  KSProjectUI
//
//  Created by Serg Bla on 17.02.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSArrayIndexChangeModel.h"

@interface KSArrayIndexChangeModel ()
@property (nonatomic, assign) NSUInteger  index;

@end

@implementation KSArrayIndexChangeModel

#pragma mark -
#pragma mark Public

+ (instancetype)objectWithChangeType:(NSUInteger)changeType index:(NSUInteger)index {
    KSArrayIndexChangeModel *object = [super objectWithChangeType:changeType];
    object.index = index;
    
    return object;
}

@end
