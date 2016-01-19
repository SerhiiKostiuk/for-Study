//
//  KSDispatcher.h
//  LearningDevelop
//
//  Created by Serg Bla on 19.01.16.
//  Copyright © 2016 Serg Bla. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KSEmployeeProtocol.h"

@interface KSDispatcher : NSObject <KSEmployeeProtocol>
@property (nonatomic, readonly) NSArray *handlers;

- (void)performWorkWithObject:(id)object;

- (void)addHandler:(id)handler;
- (void)removeHandler:(id)handler;

- (id)containHandler:(id)object;

@end
