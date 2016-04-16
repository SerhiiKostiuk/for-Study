//
//  KSUserAndUserFriendsContext.m
//  KSProjectUI
//
//  Created by Serg Bla on 12.04.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSUserAndUserFriendsContext.h"

#import "KSUser.h"
#import "KSUserContext.h"
#import "KSFacebookFriendsContext.h"

@interface KSUserAndUserFriendsContext ()
@property (nonatomic, strong) KSUserContext             *userContext;
@property (nonatomic, strong) KSFacebookFriendsContext  *friendsContext;

@end

@implementation KSUserAndUserFriendsContext

- (void)dealloc {
    self.userContext = nil;
    self.friendsContext = nil;
}

#pragma mark -
#pragma mark Accessors

- (void)setContext:(KSContext *__strong*)context value:(id)value {
    if (*context != value) {
        [*context cancel];
        *context = value;
        [*context execute];
    }
}

- (void)setUserContext:(KSUserContext *)userContext {
    [self setContext:&_userContext value:userContext];

}

- (void)setFriendsContext:(KSFacebookFriendsContext *)friendsContext {
    [self setContext:&_friendsContext value:friendsContext];
}

#pragma mark -
#pragma mark Public

- (void)execute {
    KSUser *user = self.model;
    self.userContext = [KSUserContext contextWithModel:user];
    self.friendsContext = [KSFacebookFriendsContext contextWithUser:user];
}

@end
