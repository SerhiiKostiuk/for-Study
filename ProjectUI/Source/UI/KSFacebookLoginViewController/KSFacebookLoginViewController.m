//
//  KSFacebookLoginViewController.m
//  KSProjectUI
//
//  Created by Serg Bla on 16.03.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSFacebookLoginViewController.h"
#import "FBSDKCoreKit/FBSDKAccessToken.h"
#import "KSUser.h"
#import "KSFacebookLoginContext.h"
#import "KSFriendsViewController.h"
#import "KSDispatch.h"
#import "KSUserContext.h"

@interface KSFacebookLoginViewController ()

@end

@implementation KSFacebookLoginViewController

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.user = nil;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.user = [KSUser new];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setUser:(KSUser *)user {
    if (_user != user) {
        [_user removeObserver:self];
        _user = user;
        [_user addObserver:self];
    }
}

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if ([FBSDKAccessToken currentAccessToken]) {
        [self presentFriendsViewController];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark Interface Handling

- (IBAction)onLogin:(id)sender {
    self.context = [self itemsLoadingContext];
};

#pragma mark -
#pragma mark Public

- (void)updateViewController {
    [self presentFriendsViewController];
}

- (id)itemsLoadingContext {
    KSFacebookLoginContext *context = [KSFacebookLoginContext contextWithModel:self.user];
    context.viewController = self;
    
    return context;
}

#pragma mark -
#pragma mark Private 

- (void)presentFriendsViewController {
    KSFriendsViewController *controller = [KSFriendsViewController new];
    controller.user = self.user;
    [self.navigationController pushViewController:controller animated:YES];
}

@end
