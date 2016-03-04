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

@interface KSView ()
@property (nonatomic, strong) UIView <KSLoadingView>  *loadingView;

@end

@implementation KSView

#pragma mark -
#pragma mark Initializations and Deallocations

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

- (void)setLoadingView:(UIView <KSLoadingView> *)loadingView {
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
        _loadingViewVisible = loadingViewVisible;
        [self bringSubviewToFront:self.loadingView];
        
        [self.loadingView setVisible:loadingViewVisible animated:animated completion:completion];
    }
}

#pragma mark -
#pragma mark Public

- (UIView <KSLoadingView> *)indicatorView {
    return [KSActivityIndicator indicatorWithSuperView:self];
}

@end
