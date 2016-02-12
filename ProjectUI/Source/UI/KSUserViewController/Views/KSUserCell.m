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

#pragma mark - 
#pragma mark Accessors

- (void)setUser:(KSUser *)user {
    if (_user != user) {
        _user = user;
        
        [self fillWithModel:user];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    self.accessoryType = (selected) ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
}


#pragma mark -
#pragma mark Interface Handling

- (IBAction)onSwipeRight:(UISwipeGestureRecognizer *)sender {
    UITableViewCell *tableView = self.userView;
    if (UIGestureRecognizerStateRecognized == sender.state) {
        [tableView setEditing:YES animated:YES];
    }
}

- (IBAction)onSwipeLeft:(UISwipeGestureRecognizer *)sender {
    UITableViewCell *tableView = self.userView;
    if (UIGestureRecognizerStateEnded == sender.state) {
        [tableView setEditing:NO animated:YES];
    }
}

#pragma mark -
#pragma mark Private

- (void)fillWithModel:(KSUser *)user {
    self.label.text = user.name;
    self.contentImageView.image = user.image;
    
}

@end
