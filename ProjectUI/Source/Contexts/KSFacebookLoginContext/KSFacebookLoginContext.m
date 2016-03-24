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

#import "KSWeakifyMacro.h"

KSModelForModelPropertySyntesize(KSFacebookLoginContext, KSUser, userModel);

@interface KSFacebookLoginContext ()
@property (nonatomic, strong) KSFacebookLoginViewController *viewController;
@property (nonatomic, readonly) NSString *path;
@property (nonatomic, readonly) KSUser *userModel;

@end

@implementation KSFacebookLoginContext

//#pragma mark -
//#pragma mark Initializations and Deallocations
//
//- (instancetype)init {
//    self = [super init];
//    if (self) {
//        self.viewController = [KSFacebookLoginViewController new];
//    }
//    
//    return self;
//}

#pragma mark -
#pragma mark Public

- (NSString *)path {
    return kKSUserPath;
}

- (void)handleResponse:(NSURLResponse *)response withResult:(NSDictionary *)result {
    KSUser *user = [KSUser new];
    user.firstName = result[kFBFirstNameKey];
    user.lastName = result[kFBLastNameKey];
    user.imageModel = result[kFBPictureKey];
}

#pragma mark -
#pragma mark Private

- (void)load {
    KSWeakify(self);
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc]init];
    KSFacebookLoginViewController *controller = self.viewController;
    [login logInWithReadPermissions:@[kKSPublicPermission, kKSUserFriendsPermission]
                 fromViewController:controller
                            handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
                                if (error) {
                                    NSLog(@"Process error");
                                    KSStrongifyAndReturnIfNil(self);
                                    self.userModel.state = KSModelStateFailedLoading;
                                    return;
                                }
                                
                                [super load];
                                
                                KSStrongifyAndReturnIfNil(self);
                                self.userModel.state = KSModelStateFinishedLoading;
                            }];
}

@end
