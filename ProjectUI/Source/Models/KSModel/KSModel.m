//
//  KSModel.m
//  KSProjectUI
//
//  Created by Serg Bla on 24.02.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSModel.h"

#import "KSModelObserver.h"
#import "KSDispatch.h"

@implementation KSModel

#pragma mark -
#pragma mark Public

- (void)load {
    @synchronized(self) {
        NSUInteger state = self.state;
        
        if (KSModelStateFinishedLoading == state || KSModelStateLoading == state) {
            [self notifyObserversWithSelector:[self selectorForState:state]];
            
            return;
        }
        
        self.state = KSModelStateLoading;

        KSDispatchAsyncOnBackgroundQueue(^{
            [self performBackgroundLoading];
        });
    }
}

#pragma mark -
#pragma mark Private 

- (void)performBackgroundLoading {
    [self doesNotRecognizeSelector:_cmd];
}

#pragma mark -
#pragma mark KSObservableObject

- (SEL)selectorForState:(NSUInteger)state {
    switch (state) {
        case KSModelStateLoading:
            return @selector(modelWillLoad:);
        
        case KSModelStateFinishedLoading:
            return @selector(modelDidFinishLoading:);
            
        case KSModelStateFailed:
            return @selector(modelDidFailLoading:);
            
        default:
            return [super selectorForState:state];
    }
}

@end
