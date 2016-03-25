//
//  KSViewController.m
//  KSProjectUI
//
//  Created by Serg Bla on 20.03.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSViewController.h"

#import "KSView.h"
#import "KSDispatch.h"
#import "KSFacebookLoginContext.h"
#import "UIViewController+KSExtensions.h"

KSViewControllerForViewPropertySyntesize(KSViewController, KSView, mainView);

@interface KSViewController ()

@end

@implementation KSViewController

#pragma mark -
#pragma mark Accessors

- (void)setContext:(KSContext *)context {
    if (_context != context) {
        [_context cancel];
        _context = context;
        [_context execute];
    }
}

#pragma mark -
#pragma mark Public

- (void)updateViewController {
    
}

#pragma mark -
#pragma mark KSModelObserver

- (void)modelWillLoad:(id)model {
    KSDispatchAsyncOnMainQueue(^{
        self.mainView.loadingViewVisible = YES;
    });
}

- (void)modelDidFinishLoading:(id)model {
    KSDispatchAsyncOnMainQueue(^{
        self.mainView.loadingViewVisible = NO;
    });
}

- (void)modelDidFailLoading:(id)model {
    KSDispatchAsyncOnMainQueue(^{
        self.mainView.loadingViewVisible = NO;
    });
}

@end
