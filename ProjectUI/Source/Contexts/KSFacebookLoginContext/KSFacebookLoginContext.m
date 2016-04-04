//
//  KSFacebookLoginContext.m
//  KSProjectUI
//
//  Created by Serg Bla on 15.03.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSFacebookLoginContext.h"

#import "FBSDKLoginKit/FBSDKLoginKit.h"
#import "FBSDKCoreKit/FBSDKAccessToken.h"
#import "KSUser.h"
#import "KSFacebookConstants.h"
#import "KSDispatch.h"

#import "KSWeakifyMacro.h"

KSModelForModelPropertySyntesize(KSFacebookLoginContext, KSUser, userModel);

@implementation KSFacebookLoginContext

#pragma mark -
#pragma mark Public

- (NSString *)path {
    return kKSUserPath;
}

#pragma mark -
#pragma mark Private

- (void)load {
    KSWeakify(self);
    KSDispatchAsyncOnMainQueue(^{
        KSStrongifyAndReturnIfNil(self);
        FBSDKLoginManager *login = [[FBSDKLoginManager alloc]init];
        KSUser *user = self.userModel;
        [login logInWithReadPermissions:@[kKSUserEmailPermission, kKSPublicPermission, kKSUserFriendsPermission]
                     fromViewController:self.viewController
                                handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
                                    KSStrongifyAndReturnIfNil(self);
                                    if (error) {
                                        NSLog(@"Process error");
                                        @synchronized(user) {
                                            user.state = KSModelStateFailedLoading;
                                            }
                                    } else {
                                        FBSDKAccessToken *token = [FBSDKAccessToken currentAccessToken];
                                        user.ID = token.userID;
                                        
                                        [super load];
                                    }
                                }];
    });
}

@end
