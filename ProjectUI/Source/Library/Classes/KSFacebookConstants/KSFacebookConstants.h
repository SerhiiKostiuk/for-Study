//
//  KSParsingKeys.h
//  KSProjectUI
//
//  Created by Serg Bla on 22.03.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import <Foundation/Foundation.h>

#define KSConstString(name, string) static NSString * const name = string

#pragma mark -
#pragma mark Keys

KSConstString(kFBError, @"error");
KSConstString(kFBFirstNameKey, @"first_name");
KSConstString(kFBLastNameKey, @"last_name");
KSConstString(kFBPictureKey, @"picture");
KSConstString(kFBDataKey, @"data");
KSConstString(kFBUserFriendsKey, @"friends");
KSConstString(kFBIdKey, @"id");
KSConstString(kFBURLKey, @"url");

#pragma mark -
#pragma mark Path

KSConstString(kKSUserPath, @"me");
KSConstString(kKSUserFriendsGraphPath, @"me/friends");

#pragma mark -
#pragma mark Permission

KSConstString(kKSPublicPermission, @"public_profile");
KSConstString(kKSUserFriendsPermission, @"user_friends");

#undef KSConstString
