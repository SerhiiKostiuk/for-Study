//
//  KSViewController.m
//  KSProjectUI
//
//  Created by Serg Bla on 20.03.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSViewController.h"

#import "KSView.h"
#import "KSUser.h"
#import "KSDispatch.h"
#import "KSFacebookLoginContext.h"
#import "UIAlertView+KSExtensions.h"
#import "UIViewController+KSExtensions.h"

KSViewControllerForViewPropertySyntesize(KSViewController, KSView, mainView);

@interface KSViewController ()

@end

@implementation KSViewController

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.context = nil;
    self.model = nil;
}

#pragma mark -
#pragma mark Accessors

- (void)setContext:(KSContext *)context {
    if (_context != context) {
        [_context cancel];
        _context = context;
        [_context execute];
    }
}

- (void)setModel:(id)model {
    if (_model != model) {
        [_model removeObserver:self];
        _model = model;
        [_model addObserver:self];
        
        [self updateModelAdjustment];
    }
}

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self updateViewController];
}

#pragma mark -
#pragma mark Public

- (void)updateViewController {
    
}

- (void)updateModelAdjustment {
    
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
        [self updateViewController];
        self.mainView.loadingViewVisible = NO;
    });
}

- (void)modelDidFailLoading:(id)model withError:(NSError *)error {
    KSDispatchAsyncOnMainQueue(^{
        self.mainView.loadingViewVisible = NO;
        if (error) {
            [UIAlertView presentWithError:error];
        }
    });
}

@end
