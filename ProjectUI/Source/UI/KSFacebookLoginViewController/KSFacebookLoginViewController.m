//
//  KSFacebookLoginViewController.m
//  KSProjectUI
//
//  Created by Serg Bla on 16.03.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSFacebookLoginViewController.h"

#import "KSUser.h"
#import "KSFacebookLoginContext.h"
#import "KSFriendsViewController.h"
#import "KSDispatch.h"

#import <FBSDKCoreKit/FBSDKAccessToken.h>

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
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark Interface Handling

- (IBAction)onLogin:(id)sender {
    FBSDKAccessToken *token = [FBSDKAccessToken currentAccessToken];
    KSUser *user = self.user;
    if (token) {
        user.personalId = token.userID;
        [self itemsLoadingContext];
    }
};

#pragma mark -
#pragma mark Public

- (void)updateViewController {
    KSFriendsViewController *controller = [KSFriendsViewController new];
    controller.user = self.user;
    [self.navigationController pushViewController:controller animated:YES];
}

- (id)itemsLoadingContext {
    KSFacebookLoginContext *context = [KSFacebookLoginContext contextWithModel:self.user];
    self.context = context;
    
    return context;
}

@end
