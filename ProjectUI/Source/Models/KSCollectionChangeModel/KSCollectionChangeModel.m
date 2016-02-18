//
//  KSCollectionChangeModel.m
//  KSProjectUI
//
//  Created by Serg Bla on 16.02.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSCollectionChangeModel.h"

@interface KSCollectionChangeModel ()
@property (nonatomic, assign) NSUInteger changeType;

@end

@implementation KSCollectionChangeModel

#pragma mark -
#pragma mark Public

+ (instancetype)modelWithChangeType:(NSUInteger)changeType {
    KSCollectionChangeModel *object = [self new];
    object.changeType = changeType;
    
    return object;
}


@end
