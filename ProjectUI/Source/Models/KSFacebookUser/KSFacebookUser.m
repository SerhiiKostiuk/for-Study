//
//  KSFacebookUser.m
//  KSProjectUI
//
//  Created by Serg Bla on 18.03.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSFacebookUser.h"

#import "KSImageModel.h"
#import "KSFacebookUsers.h"

static NSString * const kKSFirstNameKey   = @"firstName";
static NSString * const kKSLastNameKey    = @"lastName";
static NSString * const kKSUserFriendsKey = @"userFriends";
static NSString * const kKSImageURLKey    = @"imageURL";

@implementation KSFacebookUser


#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    if (self) {
        self.userFriends = [KSFacebookUsers new];
    }
    return self;
}

#pragma mark -
#pragma mark Accessors

- (KSImageModel *)imageModel {
    return [KSImageModel imageWithUrl:self.imageURL];
}

#pragma mark -
#pragma mark NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
    NSDictionary *encodingDictionary = @{kKSFirstNameKey : self.firstName,
                                         kKSLastNameKey : self.lastName,
                                         kKSUserFriendsKey : self.userFriends,
                                         kKSImageURLKey : self.imageURL};
    
    for (NSString *key in encodingDictionary.allKeys) {
        [aCoder encodeObject:[encodingDictionary objectForKey:key] forKey:key];
    }
}


- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self.firstName = [aDecoder decodeObjectForKey:kKSFirstNameKey];
    self.lastName = [aDecoder decodeObjectForKey:kKSLastNameKey];
    self.userFriends = [aDecoder decodeObjectForKey:kKSUserFriendsKey];
    self.imageURL = [aDecoder decodeObjectForKey:kKSImageURLKey];
    
    return self;
}


@end
