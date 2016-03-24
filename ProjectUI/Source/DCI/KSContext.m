//
//  KSContext.m
//  KSProjectUI
//
//  Created by Serg Bla on 15.03.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSContext.h"

#import "KSModel.h"
#import "KSDispatch.h"

@implementation KSContext

#pragma mark -
#pragma mark Public

- (void)execute {
    KSModel *model = self.model;
    @synchronized(model) {
        NSUInteger state = model.state;
        
        if (KSModelStateFinishedLoading == state || KSModelStateLoading == state) {
            [model notifyObserversWithSelector:[model selectorForState:state]];
            
            return;
        }
        
        model.state = KSModelStateLoading;
        
        KSDispatchAsyncOnBackgroundQueue(^{
            [self load];
        });
    }
}

- (void)cancel {
    
}

#pragma mark -
#pragma mark Private

- (void)load {
    [self doesNotRecognizeSelector:_cmd];
}

@end
