//
//  KSFriendsViewController.m
//  KSProjectUI
//
//  Created by Serg Bla on 20.03.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSFriendsViewController.h"

#import "KSUserCell.h"
#import "KSFriendsView.h"
#import "KSDispatch.h"
#import "KSUser.h"
#import "KSUsers.h"

#import "UIViewController+KSExtensions.h"

KSViewControllerForViewPropertySyntesize(KSFriendsViewController, KSFriendsView, friendsView);

@interface KSFriendsViewController ()

@end

@implementation KSFriendsViewController

#pragma mark -
#pragma mark Accessors

- (void)setUser:(KSUser *)user {
    if (_user != user) {
        [_user removeObserver:self];
        _user = user;
        [_user addObserver:self];
        self.items = user.friends;
    }
}

- (UITableView *)tableView {
    return self.friendsView.tableView;
}

#pragma mark -
#pragma mark Class Methods

+ (Class)cellClass {
    return [KSUserCell class];
}

#pragma mark -
#pragma mark Private

- (void)updateViewWithModel {
    [self.friendsView.tableView reloadData];
}
 

@end
