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

#import "UIViewController+KSExtensions.h"

KSCategoryForViewProperty(KSFriendsViewController, KSFriendsView, mainView);

@interface KSFriendsViewController ()

@end

@implementation KSFriendsViewController

#pragma mark -
#pragma mark Accessors

- (void)setUser:(KSUser *)user {
    if (_user != user) {
        [_user removeObserver:self];
//        [_user setItems:user.friends];
        _user = user;
        [_user addObserver:self];
        
    }
}

- (UITableView *)tableView {
    return self.mainView.tableView;
}

#pragma mark -
#pragma mark Class Methods

+ (Class)cellClass {
    return [KSUserCell class];
}

#pragma mark -
#pragma mark Private

- (void)updateViewWithModel {
    [self.mainView.tableView reloadData];
}

#pragma mark -
#pragma mark KSModelObserver

- (void)modelWillLoad:(id)model {
    KSDispatchAsyncOnMainQueue(^{
        self.mainView.loadingViewVisible = YES;
    });
}

- (void)modelDidFinishLoading:(id)model {
    KSDispatchAsyncOnMainQueue(^{
        [self updateViewWithModel];
        self.mainView.loadingViewVisible = NO;
    });
}

- (void)modelDidFailLoading:(id)model {
    self.mainView.loadingViewVisible = NO;
}

@end
