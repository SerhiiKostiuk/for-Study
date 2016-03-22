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
#import "KSObservableObject.h"
#import "KSContext.h"

#import "NSFileManager+KSExtensions.h"

#import "KSWeakifyMacro.h"

static NSString * const kKSPListName            = @"users.plist";
static NSString * const kKSUserFriendsGraphPath = @"me/friends";
static NSString * const kKSUserFriendsDataKey   = @"data";

@interface KSFacebookFriendsContext ()
@property (nonatomic, strong)  FBSDKGraphRequest     *request;
@property (nonatomic, strong)  KSUsers               *userFriends;
@property(nonatomic, readonly) NSString              *path;

@property (nonatomic, assign, getter=isCached) BOOL cached;

- (NSString *)usersFolderPath;
- (void)fillWithUsers:(NSArray *)objects;

@end


@implementation KSFacebookFriendsContext

@dynamic cached;

#pragma mark -
#pragma mark Accessors

- (NSString *)path {
    return [self usersFolderPath];
}

- (BOOL)isCached {
    return [[NSFileManager defaultManager] fileExistsAtPath:self.path];
}

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

- (NSString *)usersFolderPath {
    NSString *usersFolderName = [[NSFileManager applicationDataPath] stringByAppendingPathComponent:kKSPListName];
    [[NSFileManager defaultManager] provideDirectoryAtPath:usersFolderName];
    
    return usersFolderName;
}

- (void)loadFromFile {    
    NSArray *objects = nil;
    if (self.cached) {
        objects = [NSKeyedUnarchiver unarchiveObjectWithFile:self.path];
        [self fillWithUsers:objects];
        
        @synchronized(self) {
            self.model.state = KSModelStateFinishedLoading;
        }
    }
}

- (void)fillWithUsers:(NSArray *)objects {
    KSWeakify(self);
    [self.model performBlockWithoutNotification:^{
        KSStrongifyAndReturnIfNil(self);
        for (KSUser *user in objects) {
            [self.model addObject:user];
        }
    }];
}

@end
