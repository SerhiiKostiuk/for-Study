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
#import "KSModel.h"
#import "KSFacebookConstants.h"
#import "KSDispatch.h"

#import "KSWeakifyMacro.h"

//KSModelForModelPropertySyntesize(KSFacebookLoginContext, KSUser, userModel);

@implementation KSFacebookLoginContext

#pragma mark -
#pragma mark Private

- (void)load {
    KSWeakify(self);
    KSDispatchAsyncOnMainQueue(^{
        KSStrongifyAndReturnIfNil(self);
        FBSDKLoginManager *login = [[FBSDKLoginManager alloc]   init];
        KSModel *user = self.model;
        [login logInWithReadPermissions:@[kKSUserEmailPermission, kKSPublicPermission, kKSUserFriendsPermission]
                     fromViewController:self.viewController
                                handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
                                    KSStrongifyAndReturnIfNil(self);
                                    if (error) {
                                        NSLog(@"Process error");
                                        @synchronized(user) {
                                            [user setState:KSModelStateFailedLoading withObject:error];
                                        }
                                    } else {
                                        @synchronized(user) {
                                             user.state = KSModelStateFinishedLoading;
                                        }
                                    }
                                }];
    });
}

@end
