//
//  KSFriendsView.m
//  KSProjectUI
//
//  Created by Serg Bla on 20.03.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSFriendsView.h"

#import "KSUser.h"
#import "KSImageView.h"

@implementation KSFriendsView

#pragma mark -
#pragma mark Initializations and Deallocation

- (void)dealloc {
    self.user = nil;
}

#pragma mark -
#pragma mark Accessors

- (void)setUser:(KSUser *)user {
    if (_user != user) {
        _user = user;
    }
    
    [self fillWithModel:user];
}

#pragma mark -
#pragma mark Private

- (void)fillWithModel:(KSUser *)user {
    self.nameLabel.text = [NSString stringWithFormat:@"%@ %@", user.firstName, user.lastName];
    self.imageView.imageModel = user.imageModel;
}

@end
