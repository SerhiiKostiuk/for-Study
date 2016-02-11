//
//  KSUserCell.m
//  KSProjectUI
//
//  Created by Serg Bla on 09.02.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSUserCell.h"

#import "KSUser.h"

@interface KSUserCell ()

- (void)fillWithModel:(KSUser *)user;

@end

@implementation KSUserCell

- (void)setUser:(KSUser *)user {
    if (_user != user) {
        _user = user;
        
        [self fillWithModel:user];
    }
}

- (void)fillWithModel:(KSUser *)user {
    self.userLabel.text = user.name;
    
}

@end