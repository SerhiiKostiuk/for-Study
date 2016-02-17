//
//  KSCollectionChangeModel.h
//  KSProjectUI
//
//  Created by Serg Bla on 16.02.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, KSChangeType) {
    kKSChangeTypeObjectAdded,
    kKSChangeTypeObjectInserted,
    kKSChangeTypeObjectReplaced,
    kKSChangeTypeObjectExchahged,
    kKSChangeTypeObjectRemoved,
    kKSChangeTypeObjectMoved
};

@interface KSCollectionChangeModel : NSObject
@property (nonatomic, readonly) NSUInteger changeType;

+ (instancetype)objectWithChangeType:(NSUInteger)changeType;

@end
