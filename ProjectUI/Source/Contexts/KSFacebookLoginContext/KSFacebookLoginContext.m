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
#import "KSFacebookConstants.h"
#import "KSDispatch.h"

#import "KSWeakifyMacro.h"

KSModelForModelPropertySyntesize(KSFacebookLoginContext, KSUser, userModel);

@interface KSFacebookLoginContext ()
@property (nonatomic, strong) KSFacebookLoginViewController *viewController;
@property (nonatomic, readonly) NSString *path;

@end

@implementation KSFacebookLoginContext

#pragma mark -
#pragma mark Public

- (NSString *)path {
    return kKSUserPath;
}

- (NSDictionary *)parameters {
    NSString *fields = [NSString stringWithFormat:@"%@,%@,%@", kFBFirstNameKey, kFBLastNameKey, kFBPictureKey];
    
    return @{kFBFieldsKey :fields};
}

- (void)handleResponse:(NSURLResponse *)response withResult:(NSDictionary *)result {
    KSUser *user = self.userModel;
    user.personalId = result[kFBIdKey];
    user.firstName = result[kFBFirstNameKey];
    user.lastName = result[kFBLastNameKey];
    NSString *url = result [kFBPictureKey][kFBDataKey][kFBURLKey];
    user.previewImageURL = [NSURL URLWithString:url];
}

#pragma mark -
#pragma mark Private

- (void)load {
    KSWeakify(self);
    KSDispatchAsyncOnMainQueue(^{
        KSStrongifyAndReturnIfNil(self);
        FBSDKLoginManager *login = [[FBSDKLoginManager alloc]init];
        [login logOut];
        [login logInWithReadPermissions:@[kKSUserEmailPermission, kKSPublicPermission, kKSUserFriendsPermission]
                     fromViewController:self.viewController
                                handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
                                    KSStrongifyAndReturnIfNil(self);
                                    if (error) {
                                        NSLog(@"Process error");
                                        @synchronized(self.userModel) {
                                            self.userModel.state = KSModelStateFailedLoading;
                                            }
                                    } else {
                                        [super load];
                                    }
                                }];
    });
}

@end
