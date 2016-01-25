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

void KSDispatchAsyncOnBackgroundQueue(dispatch_block_t block) {
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0), block);
}

void KSDispatchSyncOnBackgroundQueue(dispatch_block_t block) {
    dispatch_sync(dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0), block);
}

void KSDispatchAsyncOnMainQueue(dispatch_block_t block) {
    dispatch_async(dispatch_get_main_queue(), block);
}

void KSDispatchSyncOnMainQueue(dispatch_block_t block) {
    dispatch_sync(dispatch_get_main_queue(), block);
}
