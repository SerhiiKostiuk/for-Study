//
//  KSFacebookFriendsContext.m
//  KSProjectUI
//
//  Created by Serg Bla on 15.03.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSFacebookFriendsContext.h"

#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import "KSUser.h"
#import "KSUsers.h"

static NSString * const kKSUserFriendsGraphPath = @"me/friends";
static NSString * const kKSUserFriendsDataKey = @"data";

@interface KSFacebookFriendsContext ()
@property (nonatomic, strong) FBSDKGraphRequest           *request;
@property (nonatomic, strong) FBSDKGraphRequestConnection *connection;
@property (nonatomic, strong) KSUsers                     *userFriends;

@end


@implementation KSFacebookFriendsContext

#pragma mark -
#pragma mark Private

- (void)performBackgroundLoading {
    FBSDKGraphRequest *request = self.request;
    request = [self graphRequest:kKSUserFriendsGraphPath];
    
    FBSDKGraphRequestConnection *connection = self.connection;
    [connection addRequest:request
         completionHandler:^(FBSDKGraphRequestConnection *aConnection, id result, NSError *error)
     {
         if (error) {
             NSLog(@"Error connecting");
//             @synchronized(<#token#>) {
//                 state = KSModelStateFailedLoading;
//             }
         } else if (!error) {
             NSArray *friendList = [result objectForKey:kKSUserFriendsDataKey];
             KSUser *user = self.user;
             NSMutableArray *downloadFriends = [NSMutableArray new];
             
             [downloadFriends addObjectsFromArray:friendList];
             user.friends = downloadFriends;
         }
         
     }];
    
    [connection start];
}


@end
