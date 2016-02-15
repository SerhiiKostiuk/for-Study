//
//  KSAdapterModel.h
//  KSProjectUI
//
//  Created by Serg Bla on 14.02.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, KSAdapterState) {
    kKSAdapterStateNoChanges,
    kKSAdapterStateObjectAdded,
    kKSAdapterStateObjectInserted,
    kKSAdapterStateObjectReplaced,
    kKSAdapterStateObjectExchahged,
    kKSAdapterStateObjectRemoved
};

@interface KSAdapterModel : NSObject
@property (nonatomic, readonly) NSUInteger adapterState;

@end
