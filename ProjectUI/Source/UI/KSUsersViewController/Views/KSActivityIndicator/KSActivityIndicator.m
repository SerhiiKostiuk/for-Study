//
//  KSWaitActivityView.m
//  KSProjectUI
//
//  Created by Serg Bla on 25.02.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSActivityIndicator.h"

#import "UINib+KSExtensions.h"
#import "KSMacro.h"

typedef void(^KSVoidBlock)(void);

static const NSTimeInterval KSDuration = 0.5;
static const CGFloat KSVisibleAlpha    = 1.0;

@implementation KSActivityIndicator

@synthesize visible = _visible;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)indicatorWithSuperView:(UIView *)superView {
    KSActivityIndicator *view = [UINib objectWithClass:[self class]];
    view.frame = superView.bounds;
    view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [superView addSubview:view];
    
    return view;
}

#pragma mark -
#pragma mark KSLoadingView

- (void)setVisible:(BOOL)visible animated:(BOOL)animated {
    [self setVisible:visible animated:animated completion:nil];
}

- (void)setVisible:(BOOL)visible animated:(BOOL)animated completion:(KSVoidBlock)completion {
    if (_visible != visible) {
        if (!_visible) {
            _visible = visible;
        }
        
        [self.activityIndicatorView startAnimating];
        
        [UIView animateWithDuration:animated ? KSDuration : 0
                         animations:^{
                             self.alpha = visible ? KSVisibleAlpha : 0;
                         }
                         completion:^(BOOL finished) {
                             if (_visible) {
                                 _visible = visible;
                             }
                             
                             KSBlockCall(completion);
                         }];
    }
}

@end
