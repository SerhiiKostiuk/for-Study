//
//  KSUserCell.m
//  KSProjectUI
//
//  Created by Serg Bla on 09.02.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSUserCell.h"

#import "KSUser.h"
#import "KSImageView.h"

@implementation KSUserCell

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

- (void)prepareForReuse {
    [super prepareForReuse];
    
    self.user = nil;
}

- (void)fillWithModel:(KSUser *)user {
    self.label.text = [NSString stringWithFormat:@"%@ %@", user.firstName, user.lastName];
//    self.contentImageView.imageModel = user.previewImageModel;
}

@end
