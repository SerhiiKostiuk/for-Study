//
//  KSView.m
//  KSProjectUI
//
//  Created by Serg Bla on 26.02.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSView.h"
#import "KSActivityIndicator.h"

@implementation KSView

- (void)setLoadingViewVisible:(BOOL)loadingViewVisible animated:(BOOL)animated {
//    [KSActivityIndicator indicatorWithSuperView:self];
    if (self.loadingViewVisible) {
        [KSActivityIndicator indicatorWithSuperView:self];
        self.alpha = 1.0;
    } else {
        animated = NO;
        self.alpha = 0.0;
    }  
}

- (void)setLoadingViewVisible:(BOOL)loadingViewVisible animated:(BOOL)animated completion:(id)completion {
    
}

- (UIView *)loadingView {
    return nil;
}

@end
