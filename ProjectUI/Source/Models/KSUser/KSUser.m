//
//  KSUser.m
//  KSProjectUI
//
//  Created by Serg Bla on 09.02.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSUser.h"

#import "KSImageModel.h"
#import "KSUsers.h"

static NSString * const kKSUserIdKey           = @"ID";
static NSString * const kKSFirstNameKey        = @"firstName";
static NSString * const kKSLastNameKey         = @"lastName";
static NSString * const kKSFriendsKey          = @"friends";
static NSString * const kKSPreviewImageURLKey  = @"previewImageURL";
static NSString * const kKSLargeImageURLKey    = @"largeImageURL";
static NSString * const kKSGenderKey           = @"gender";

@implementation KSUser

@dynamic imageModel;

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    if (self) {
        self.friends = [KSUsers new];
    }
    return self;
}

#pragma mark -
#pragma mark Accessors

- (KSImageModel *)imageModel {
    return [KSImageModel imageWithUrl:self.previewImageURL];
}

- (KSImageModel *)largeImageModel {
    return [KSImageModel imageWithUrl:self.largeImageURL];
}

#pragma mark -
#pragma mark NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
    NSDictionary *encodingDictionary = @{kKSUserIdKey : self.ID,
                                         kKSFirstNameKey : self.firstName,
                                         kKSLastNameKey : self.lastName,
                                         kKSFriendsKey : self.friends,
                                         kKSGenderKey : self.gender,
                                         kKSPreviewImageURLKey : self.previewImageURL,
                                         kKSLargeImageURLKey : self.largeImageURL};
    
    for (NSString *key in encodingDictionary.allKeys) {
        [aCoder encodeObject:[encodingDictionary objectForKey:key] forKey:key];
    }
}


- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self.ID = [aDecoder decodeObjectForKey: kKSUserIdKey];
    self.firstName = [aDecoder decodeObjectForKey:kKSFirstNameKey];
    self.lastName = [aDecoder decodeObjectForKey:kKSLastNameKey];
    self.friends = [aDecoder decodeObjectForKey:kKSFriendsKey];
    self.gender = [aDecoder decodeObjectForKey: kKSGenderKey];
    self.previewImageURL = [aDecoder decodeObjectForKey:kKSPreviewImageURLKey];
    self.largeImageURL = [aDecoder decodeObjectForKey:kKSLargeImageURLKey];
    
    return self;
}

@end
