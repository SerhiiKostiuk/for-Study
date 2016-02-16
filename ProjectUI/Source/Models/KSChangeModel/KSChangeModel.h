//
//  KSAdapterModel.h
//  KSProjectUI
//
//  Created by Serg Bla on 14.02.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, KSChangeType) {
    kKSChangeModelTypeObjectAdded,
    kKSChangeModelTypeObjectInserted,
    kKSChangeModelTypeObjectReplaced,
    kKSChangeModelTypeObjectExchahged,
    kKSChangeModelTypeObjectRemoved,
    kKSChangeModelTypeObjectMoved
};

@interface KSChangeModel : NSObject
@property (nonatomic, readonly) NSUInteger changeModelType;

@end
