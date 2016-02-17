//
//  KSCollectionChangeModel.h
//  KSProjectUI
//
//  Created by Serg Bla on 16.02.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KSCollectionChangeModel : NSObject
@property (nonatomic, readonly) NSUInteger changeType;

+ (instancetype)objectWithChangeType:(NSUInteger)changeType;

@end
