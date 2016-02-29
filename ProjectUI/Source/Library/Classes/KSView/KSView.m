//
//  KSView.m
//  KSProjectUI
//
//  Created by Serg Bla on 26.02.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSView.h"
#import "KSActivityIndicator.h"

#import "KSMacro.h"

static const NSTimeInterval KSDuration = 2.0;

@interface KSView ()
@property (nonatomic, strong) KSActivityIndicator *activityIndicator;
@property (nonatomic, strong) UIView              *loadingView;

@end

@implementation KSView

#pragma mark -
#pragma mark Initiazations and Deallocations

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    self.loadingView = [self indicatorView];
    
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.loadingView = [self indicatorView];
}

#pragma mark -
#pragma mark Accessors

- (void)setLoadingView:(UIView *)loadingView {
    if (_loadingView != loadingView) {
        [_loadingView removeFromSuperview];
        _loadingView = loadingView;
        [self addSubview:_loadingView];
    }
}

- (void)setLoadingViewVisible:(BOOL)loadingViewVisible {
    [self setLoadingViewVisible:loadingViewVisible animated:YES];
}

- (void)setLoadingViewVisible:(BOOL)loadingViewVisible animated:(BOOL)animated {
    [self setLoadingViewVisible:loadingViewVisible animated:animated completion:nil];
}

- (void)setLoadingViewVisible:(BOOL)loadingViewVisible animated:(BOOL)animated completion:(KSVoidBlock)completion {
    if (_loadingViewVisible != loadingViewVisible) {
        [self bringSubviewToFront:self.loadingView];
        [UIView animateWithDuration:animated ? KSDuration : 0.0
                         animations:^{
                             self.alpha = _loadingViewVisible ? 1.0 : 0.0;
                         }
                         completion:^(BOOL finished) {
                             _loadingViewVisible = loadingViewVisible;
                             
                             if (completion) {
                                 completion();
                             }
//                             KSBlockCall(completion);
                         }];
    }
}

- (UIView *)indicatorView {
//  return [[self.activityIndicator class] indicatorWithSuperView:self];
    return [KSActivityIndicator indicatorWithSuperView:self];
}

@end
