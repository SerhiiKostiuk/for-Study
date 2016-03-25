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
    
    @synchronized(self.userModel) {
        self.userModel.state = KSModelStateFinishedLoading;
    }
}

#pragma mark -
#pragma mark Private

- (void)load {
    KSWeakify(self);
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc]init];
    [login logInWithReadPermissions:@[kKSPublicPermission, kKSUserFriendsPermission]
                 fromViewController:self.viewController
                            handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
                                if (error) {
                                    NSLog(@"Process error");
                                    KSStrongifyAndReturnIfNil(self);
                                    @synchronized(self.userModel) {
                                         self.userModel.state = KSModelStateFailedLoading;
                                        
                                        return;
                                    }
                                }
                                
                                [super load];
                            }];
}

@end
