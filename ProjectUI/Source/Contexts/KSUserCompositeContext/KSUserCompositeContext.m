//
//  KSUserCompositeContext.m
//  KSProjectUI
//
//  Created by Serg Bla on 12.04.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSUserCompositeContext.h"

#import "KSUser.h"
#import "KSUserContext.h"
#import "KSFacebookFriendsContext.h"

@interface KSUserCompositeContext ()
@property (nonatomic, strong) KSUserContext             *userContext;
@property (nonatomic, strong) KSFacebookFriendsContext  *friendsContext;

@end

@implementation KSUserCompositeContext

- (void)setUserContext:(KSUserContext *)userContext { // make macros from this setters
    if (_userContext != userContext) {
        [_userContext cancel];
        _userContext = userContext;
        [_userContext execute];
    }
}

- (void)setFriendsContext:(KSFacebookFriendsContext *)friendsContext {
    if (_friendsContext != friendsContext) {
        [_friendsContext cancel];
        _friendsContext = friendsContext;
        [_friendsContext execute];
    }
}

#pragma mark -
#pragma mark Public

- (void)execute {
    KSUser *user = self.model;
    self.userContext = [KSUserContext contextWithModel:user];
    self.friendsContext = [KSFacebookFriendsContext contextWithModel:user];
}

@end
