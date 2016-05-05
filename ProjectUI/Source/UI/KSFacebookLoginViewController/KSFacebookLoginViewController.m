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
#import "KSCoreDataManager.h"
#import "UIAlertView+KSExtensions.h"
#import "KSModel.h"
#import "KSManagedObject.h"

@implementation KSFacebookLoginViewController

#pragma mark - Interface Handling

- (IBAction)onLogin:(id)sender {
    self.model = [KSModel new];
    self.context = [self itemsLoadingContext];
}

#pragma mark - Public

- (void)updateViewController {
    [self presentFriendsViewController];
}

- (id)itemsLoadingContext {
    KSFacebookLoginContext *context = [KSFacebookLoginContext contextWithModel:self.model];
    context.viewController = self;
    
    return context;
}

#pragma mark - Private

- (KSUser *)currentTokenUser {
    FBSDKAccessToken *token = [FBSDKAccessToken currentAccessToken];
    if (token) {
        NSString *entityName = NSStringFromClass([KSUser class]);
        
        return [KSManagedObject managedObjectWithID:token.userID AndEntityName:entityName];
    }
    
    return nil;
}

- (void)presentFriendsViewController {
    KSUser *user = [self currentTokenUser];
        KSFriendsViewController *controller = [KSFriendsViewController new];
        controller.model = user;
        
        user = nil;
        
        [self.navigationController pushViewController:controller animated:NO];
}

@end
