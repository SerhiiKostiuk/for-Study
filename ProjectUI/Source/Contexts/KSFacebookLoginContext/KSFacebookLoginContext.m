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
#import "KSModel.h"
#import "KSUser.h"
#import "KSParsingKeys.h"

static NSString * const  kKSPublicPermission      = @"public_profile";
static NSString * const  kKSUserFriendsPermission = @"user_friends";
static NSString * const  kKSUserPath              = @"me";


@interface KSFacebookLoginContext ()
@property (nonatomic, strong) KSFacebookLoginViewController *viewController;
@property (nonatomic, copy) NSString *path;

@end

@implementation KSFacebookLoginContext

#pragma mark -
#pragma mark Public

- (NSString *)path {
    return self.path = kKSUserPath;
}

- (void)handleResponse:(NSURLResponse *)response withResult:(NSDictionary *)result {
    KSUser *user = [KSUser new];
    user.firstName = result[kFBFirstNameKey];
    user.lastName = result[kFBLastNameKey];
}

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
                                       self.model.state = KSModelStateFailedLoading;
                                       return;
                                   }
                                   
                                   [super performBackgroundLoading];
                               }];

}

@end
