//
//  KSCollectionChangeModel.h
//  KSProjectUI
//
//  Created by Serg Bla on 16.02.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KSChangeModel.h"

@interface KSCollectionChangeModel : NSObject
@property (nonatomic, readonly) KSChangeType changeModelType;

+ (instancetype)objectWithChangeType:(KSChangeType)changeType;

@end
