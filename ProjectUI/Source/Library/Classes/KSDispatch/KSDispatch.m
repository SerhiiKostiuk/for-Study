//
//  KSDispatch.m
//  LearningDevelop
//
//  Created by Serg Bla on 23.01.16.
//  Copyright © 2016 Serg Bla. All rights reserved.
//

#import "KSDispatch.h"

#pragma mark -
#pragma mark Puplic

void KSDispatchOnce(dispatch_block_t block) {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        block();
    });
}

void KSDispatchAsyncOnDefaultQueue(dispatch_block_t block) {
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_DEFAULT, 0), block);
}

void KSDispatchSyncOnDefaultQueue(dispatch_block_t block) {
    dispatch_sync(dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0), block);
}

void KSDispatchAsyncOnBackgroundQueue(dispatch_block_t block) {
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0), block);
}

void KSDispatchSyncOnBackgroundQueue(dispatch_block_t block) {
    dispatch_sync(dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0), block);
}

void KSDispatchAsyncOnMainQueue(dispatch_block_t block) {
    if (!block) {
        return;
    }
    
    dispatch_async(dispatch_get_main_queue(), block);
}

void KSDispatchSyncOnMainQueue(dispatch_block_t block) {
    if (!block) {
        return;
    }
    
    dispatch_sync(dispatch_get_main_queue(), block);
}

void KSDispatchAsyncOnQueue(KSDispatchQueueType type, dispatch_block_t block) {
    if (!block) {
        return;
    }
    
    dispatch_async(KSDispatchGetQueue(type), block);
}

void KSDispatchSyncOnQueue(KSDispatchQueueType type, dispatch_block_t block) {
    if (!block) {
        return;
    }
    
    dispatch_sync(KSDispatchGetQueue(type), block);
}

dispatch_queue_t KSDispatchGetQueue(KSDispatchQueueType type) {
    if (KSDispatchQueueMain == type) {
        return dispatch_get_main_queue();
    }
    
    return dispatch_get_global_queue(type, 0);
}
