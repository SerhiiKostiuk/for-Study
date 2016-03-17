//
//  KSFacebookFriendsContext.m
//  KSProjectUI
//
//  Created by Serg Bla on 15.03.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSFacebookFriendsContext.h"

#import <FBSDKCoreKit/FBSDKCoreKit.h>

@interface KSFacebookFriendsContext ()
@property (nonatomic, strong) NSMutableArray  *friendsFromFacebook;

@end


@implementation KSFacebookFriendsContext

- (void)dowloadFriendsFromFacebook {
    FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc] initWithGraphPath:@"me/friends"
                                                                   parameters:nil
                                                                   HTTPMethod:@"GET"];
    [request startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
        if (!error) {
            NSArray *friendList = [result objectForKey:@"data"];
            
            [self.friendsFromFacebook addObjectsFromArray:friendList];
        }
    }];
}


@end
