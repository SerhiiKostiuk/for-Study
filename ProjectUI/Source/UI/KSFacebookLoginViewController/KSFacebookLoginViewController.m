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

#pragma mark -
#pragma mark Accessors

- (void)setUser:(KSUser *)user {
    [super setUser:user];
}

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self presentFriendsViewController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark Interface Handling

- (IBAction)onLogin:(id)sender {
    self.user = [KSUser new];
    self.context = [self itemsLoadingContext];
}

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
    FBSDKAccessToken *token = [FBSDKAccessToken currentAccessToken];
    if (token) {
        KSUser *user = [KSUser new];
        user.ID = token.userID;
        KSFriendsViewController *controller = [KSFriendsViewController new];
        controller.user = user;
                
        [self.navigationController pushViewController:controller animated:NO];
    }
   
}

@end
