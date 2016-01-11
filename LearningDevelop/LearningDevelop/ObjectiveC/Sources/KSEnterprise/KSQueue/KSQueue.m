//
//  KSQueue.m
//  LearningDevelop
//
//  Created by Serg Bla on 11.01.16.
//  Copyright © 2016 Serg Bla. All rights reserved.
//

#import "KSQueue.h"

@implementation KSQueue

- (void)addToQueue:(id)object {
    @synchronized(self) {
        [self addItem:object];
    }
}

- (id)removeDequeue {
    id object = nil;
    
    @synchronized(self) {
        object = [[self items] lastObject];
        
        if (object) {
            [[object retain] autorelease];
            [self removeItem:object];
        }
    }
    
    return object;
}

@end
