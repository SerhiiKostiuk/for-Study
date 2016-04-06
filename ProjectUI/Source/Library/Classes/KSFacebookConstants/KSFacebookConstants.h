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

KSConstString(kFBIdKey, @"id");
KSConstString(kFBURLKey, @"url");
KSConstString(kFBError, @"error");
KSConstString(kFBDataKey, @"data");
KSConstString(kFBGenderKey, @"gender");
KSConstString(kFBFieldsKey, @"fields");
KSConstString(kFBPictureKey, @"picture");
KSConstString(kFBLastNameKey, @"last_name");
KSConstString(kFBUserFriendsKey, @"friends");
KSConstString(kFBFirstNameKey, @"first_name");
KSConstString(kFBLargePictureKey, @"picture.type(large)");

#pragma mark -
#pragma mark Path

KSConstString(kKSUserPath, @"me");
KSConstString(kKSUserFieldsPath, @"me?fields");
KSConstString(kKSUserFriendsGraphPath, @"me/friends");

#pragma mark -
#pragma mark Permission

KSConstString(kKSUserEmailPermission, @"email");
KSConstString(kKSPublicPermission, @"public_profile");
KSConstString(kKSUserFriendsPermission, @"user_friends");

#undef KSConstString
