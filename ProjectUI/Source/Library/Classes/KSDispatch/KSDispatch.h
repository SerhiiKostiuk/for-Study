//
//  KSDispatch.h
//  LearningDevelop
//
//  Created by Serg Bla on 23.01.16.
//  Copyright © 2016 Serg Bla. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, KSDispatchQueueType) {
    KSDispatchQueueHigh = DISPATCH_QUEUE_PRIORITY_HIGH,
    KSDispatchQueueDefault = DISPATCH_QUEUE_PRIORITY_DEFAULT,
    KSDispatchQueueLow = DISPATCH_QUEUE_PRIORITY_LOW,
    KSDispatchQueueBackground = DISPATCH_QUEUE_PRIORITY_BACKGROUND,
    KSDispatchQueueMain
};

extern
void KSDispatchOnce(dispatch_block_t block);

extern
void KSDispatchAsyncOnDefaultQueue(dispatch_block_t block);

extern
void KSDispatchSyncOnDefaultQueue(dispatch_block_t block);

extern
void KSDispatchAsyncOnBackgroundQueue(dispatch_block_t block);

extern
void KSDispatchSyncOnBackgroundQueue(dispatch_block_t block);

extern
void KSDispatchAsyncOnMainQueue(dispatch_block_t block);

extern
void KSDispatchSyncOnMainQueue(dispatch_block_t block);

extern
void KSDispatchAsyncOnQueue(KSDispatchQueueType type, dispatch_block_t block);

extern
void KSDispatchSyncOnQueue(KSDispatchQueueType type, dispatch_block_t block);

extern
dispatch_queue_t KSDispatchGetQueue(KSDispatchQueueType type);
