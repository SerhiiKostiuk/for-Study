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
#import "KSFacebookConstants.h"

#import "NSFileManager+KSExtensions.h"

#import "KSWeakifyMacro.h"

KSModelForModelPropertySyntesize(KSFacebookFriendsContext, KSUsers, usersModel);

@interface KSFacebookFriendsContext ()
@property (nonatomic, readonly) NSString  *folderPath;
@property (nonatomic, readonly) NSString  *graphPath;

@property (nonatomic, assign, getter=isCached) BOOL cached;

- (void)fillWithUsers:(NSArray *)objects;

@end


@implementation KSFacebookFriendsContext

@dynamic cached;

#pragma mark -
#pragma mark Accessors

- (NSString *)folderPath {
    return self.user.friends.path;
}

- (NSString *)graphPath {
    return kKSUserFriendsGraphPath;
}

- (BOOL)isCached {
    return [[NSFileManager defaultManager] fileExistsAtPath:self.folderPath];
}

- (FBSDKGraphRequest *)graphRequest {
    return [[FBSDKGraphRequest alloc] initWithGraphPath:self.graphPath parameters:nil];
}

#pragma mark -
#pragma mark Public

- (void)handleResponse:(NSURLResponse *)response withResult:(NSDictionary *)result {
    NSArray *friendList = result[kFBUserFriendsKey][kFBDataKey];
    KSWeakify(self);
    
    [self.usersModel performBlockWithoutNotification:^{
        KSStrongifyAndReturnIfNil(self);
        for (id friend in friendList) {
            KSUser *user = [KSUser new];
            user.personalId = friend[kFBIdKey];
            user.firstName = friend[kFBFirstNameKey];
            user.lastName = friend[kFBLastNameKey];
            NSString *url = friend[kFBPictureKey][kFBDataKey][kFBURLKey];
            user.previewImageURL = [NSURL URLWithString:url];
            
            KSUsers *friends = self.user.friends;
            [friends addObject:user];
        }
    }];
}

#pragma mark -
#pragma mark Private

- (void)load {
    [super load];
}

- (void)loadFromFile {    
    NSArray *objects = nil;
    if (self.cached) {
        objects = [NSKeyedUnarchiver unarchiveObjectWithFile:self.path];
        [self fillWithUsers:objects];
        
        @synchronized(self) {
            self.usersModel.state = KSModelStateFinishedLoading;
        }
    }
}

- (void)fillWithUsers:(NSArray *)objects {
    KSWeakify(self);
    [self.model performBlockWithoutNotification:^{
        KSStrongifyAndReturnIfNil(self);
        for (KSUser *user in objects) {
            KSUsers *friends = self.user.friends;
            [friends addObject:user];
        }
    }];
}

@end
