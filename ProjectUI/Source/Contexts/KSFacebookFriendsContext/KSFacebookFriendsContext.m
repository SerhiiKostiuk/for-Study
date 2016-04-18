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

@property (nonatomic, assign, getter=isCached) BOOL cached;

- (void)fillWithUsers:(NSArray *)objects;

@end

@implementation KSFacebookFriendsContext

@dynamic cached;

#pragma mark -
#pragma mark Initializations And Deallocations

- (void)dealloc {
    self.user = nil;
}

- (instancetype)initWithUser:(KSUser *)user {
    self = [super init];
    self.user = user;
    
    return self;
}

#pragma mark -
#pragma mark Class Methods

+ (instancetype)contextWithUser:(KSUser *)user {
    return [[self alloc] initWithUser:user];
}

#pragma mark -
#pragma mark Accessors

- (void)setUser:(KSUser *)user {
    if (_user != user) {
        _user = user;
        
        self.model = user.friends;
    }
}

- (NSString *)folderPath {
    return self.usersModel.usersPath;
}

- (NSString *)path {
    return kKSUserFieldsPath;
}

- (BOOL)isCached {
    return [[NSFileManager defaultManager] fileExistsAtPath:self.folderPath];
}

- (NSDictionary *)parameters {
    NSString *fields = [NSString stringWithFormat:@"%@{%@,%@,%@{%@}}",
                        kFBUserFriendsKey,
                        kFBFirstNameKey,
                        kFBLastNameKey,
                        kFBPictureKey,
                        kFBURLKey];
    
    return @{kFBFieldsKey :fields};
}

#pragma mark -
#pragma mark Public

- (NSUInteger)shouldLoadState:(NSUInteger)state {
    if (KSModelStateFinishedLoading == state || KSModelStateLoading == state) {
        return state;
    }
    return 0;
}

- (void)fillModelWithResult:(NSDictionary *)result {
    NSArray *friendList = result[kFBUserFriendsKey][kFBDataKey];
    KSWeakify(self);
   
    KSUsers *friends = self.usersModel;
    [friends performBlockWithoutNotification:^{
        KSStrongifyAndReturnIfNil(self);
        for (id friend in friendList) {
            KSUser *user = [KSUser new];
            
            user.ID = friend[kFBIdKey];
            user.firstName = friend[kFBFirstNameKey];
            user.lastName = friend[kFBLastNameKey];
            
            NSString *url = friend[kFBPictureKey][kFBDataKey][kFBURLKey];
            user.previewImageURL = [NSURL URLWithString:url];
            
            [friends addObject:user];
        }
    }];
}

#pragma mark -
#pragma mark Private

- (void)load {
    if (self.cached) {
        [super load];
    } else {
        [self loadFromFile];
    }
}

- (void)loadFromFile {    
    if (self.cached) {
       NSArray *objects = [NSKeyedUnarchiver unarchiveObjectWithFile:self.folderPath];
        [self fillWithUsers:objects];
        
        @synchronized(self) {
            self.usersModel.state = KSModelStateFinishedLoading;
        }
    }
}

- (void)fillWithUsers:(NSArray *)objects {
    KSWeakify(self);
    [self.model performBlockWithoutNotification:^{
        KSUsers *friends = self.usersModel;
        KSStrongifyAndReturnIfNil(self);
        for (KSUser *user in objects) {
            [friends addObject:user];
        }
    }];
}

@end
