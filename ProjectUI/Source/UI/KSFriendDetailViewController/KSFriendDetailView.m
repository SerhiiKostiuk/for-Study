//
//  KSFriendDetailView.m
//  KSProjectUI
//
//  Created by Serg Bla on 20.03.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSFriendDetailView.h"

#import "KSImageView.h"
#import "KSUser.h"

@implementation KSFriendDetailView

#pragma mark -
#pragma mark Accessors

- (void)setUser:(KSUser *)user {
    if (_user != user) {
        _user = user;
        
        [self fillWithModel:user];
    }
}

#pragma mark -
#pragma mark Private

- (void)fillWithModel:(KSUser *)user {
    self.firstNameLabel.text = user.firstName;
    self.lastNameLabel.text = user.lastName;
    self.genderLabel.text = user.gender;
    self.imageView.imageModel = user.largeImageModel;
}

@end
