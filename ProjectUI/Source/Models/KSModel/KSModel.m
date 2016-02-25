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
#pragma mark KSObservableObject

- (SEL)selectorForState:(NSUInteger)state {
    switch (state) {
        case KSModelStateReady:
            return @selector(modelDidReadyToLoad:);
        
        case KSModelStateFinished:
            return @selector(modelDidLoad:);
            
        case KSModelStateCanceled:
            return @selector(modelDidCancelLoading:);
            
        case KSModelStateFailed:
            return @selector(modelDidFailToLoad:);
            
        default:
            return [super selectorForState:state];
    }
}

@end
