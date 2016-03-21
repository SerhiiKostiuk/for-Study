//
//  KSFacebookLoginContext.m
//  KSProjectUI
//
//  Created by Serg Bla on 15.03.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSFacebookLoginContext.h"

#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import "KSFacebookLoginViewController.h"

static NSString * const  kKSPublicPermission = @"public_profile";
static NSString * const  kKSUserFriendsPermission = @"user_friends";

@interface KSFacebookLoginContext ()
@property (nonatomic, strong) KSFacebookLoginViewController *viewController;

@end

@implementation KSFacebookLoginContext

#pragma mark -
#pragma mark Private

- (void)performBackgroundLoading {
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc]init];
    KSFacebookLoginViewController *controller = self.viewController;
    [login logInWithPublishPermissions:@[kKSPublicPermission, kKSUserFriendsPermission]
                    fromViewController:controller
                               handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
                                   if (error) {
                                       NSLog(@"Process error");
                                   } else if (result.isCancelled) {
                                       NSLog(@"Cancelled");
                                   } else {
                                       NSLog(@"Logged in");
                                   }
                               }];

}

@end
