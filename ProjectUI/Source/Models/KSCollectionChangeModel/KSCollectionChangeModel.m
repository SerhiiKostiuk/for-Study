//
//  KSCollectionChangeModel.m
//  KSProjectUI
//
//  Created by Serg Bla on 16.02.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSCollectionChangeModel.h"

@interface KSCollectionChangeModel ()
@property (nonatomic, assign) KSChangeType changeModelType;

@end

@implementation KSCollectionChangeModel

+ (instancetype)objectWithChangeType:(KSChangeType)changeType {
    KSCollectionChangeModel *object = [self new];
    object.changeModelType = changeType;
    
    return object;
}


@end
