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
#import "KSFacebookFriendsContext.h"

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

#pragma mark-
#pragma mark View Lifecycle

- (void)viewWillAppear:(BOOL)animated {
    [self itemsLoadingContext];
}

#pragma mark -
#pragma mark Public

- (void)updateViewController {
    [self.friendsView.tableView reloadData];
}

- (id)itemsLoadingContext {
    KSFacebookFriendsContext *context = [KSFacebookFriendsContext contextWithModel:self.items];
    self.context = context;
    
    return context;
}

@end
