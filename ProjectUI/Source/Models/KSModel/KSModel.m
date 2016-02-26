//
//  KSModel.m
//  KSProjectUI
//
//  Created by Serg Bla on 24.02.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSModel.h"

#import "KSModelObserver.h"

@implementation KSModel

#pragma mark -
#pragma mark Public

- (void)load {
    @synchronized(self) {
        NSUInteger state = self.state;
        
        if (KSModelStateFinished == state || KSModelStateLoad == state) {
            [self notifyObserversWithSelector:[self selectorForState:state]];
        }
    }
}

#pragma mark -
#pragma mark KSObservableObject

- (SEL)selectorForState:(NSUInteger)state {
    switch (state) {
        case KSModelStateLoad:
            return @selector(modelDidLoading:);
        
        case KSModelStateFinished:
            return @selector(modelDidFinishLoading:);
            
        case KSModelStateFailed:
            return @selector(modelDidFailLoading:);
            
        default:
            return [super selectorForState:state];
    }
}

@end
