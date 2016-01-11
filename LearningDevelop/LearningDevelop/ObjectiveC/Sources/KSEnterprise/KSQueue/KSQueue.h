//
//  KSQueue.h
//  LearningDevelop
//
//  Created by Serg Bla on 11.01.16.
//  Copyright © 2016 Serg Bla. All rights reserved.
//

#import "KSItemsContainer.h"

@interface KSQueue : KSItemsContainer

- (void)addToQueue:(id)object;
- (id)removeDequeue;

@end
