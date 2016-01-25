//
//  KSDispatch.h
//  LearningDevelop
//
//  Created by Serg Bla on 23.01.16.
//  Copyright © 2016 Serg Bla. All rights reserved.
//

void KSDispatchAsyncOnBackgroundQueue(dispatch_block_t block);
void KSDispatchSyncOnBackgroundQueue(dispatch_block_t block);

void KSDispatchAsyncOnMainQueue(dispatch_block_t block);
void KSDispatchSyncOnMainQueue(dispatch_block_t block);
