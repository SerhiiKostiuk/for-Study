//
//  KSContext.m
//  KSProjectUI
//
//  Created by Serg Bla on 15.03.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSContext.h"

#import "KSModel.h"

#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import "KSDispatch.h"

@implementation KSContext

#pragma mark -
#pragma mark Public

- (void)execute {
    KSModel *model = self.model;
    @synchronized(model) {
        [self notifyWithState];
        
        model.state = KSModelStateLoading;
        
        KSDispatchAsyncOnBackgroundQueue(^{
            [self performBackgroundLoading];
        });
    }
    
}

- (void)cancel {
    
}

- (FBSDKGraphRequest *)graphRequest:(NSString *)grathPath {
    return [[FBSDKGraphRequest alloc] initWithGraphPath:grathPath parameters:nil];
}


#pragma mark -
#pragma mark Private

- (void)performBackgroundLoading {
    [self doesNotRecognizeSelector:_cmd];
}

- (void)notifyWithState {
    KSModel *model = self.model;
    NSUInteger state = model.state;
    
    if (KSModelStateFinishedLoading == state || KSModelStateLoading == state) {
        [model notifyObserversWithSelector:[model selectorForState:state]];
        
        return;
    }
}

@end
