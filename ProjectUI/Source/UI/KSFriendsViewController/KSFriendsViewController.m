//
//  KSFriendsViewController.m
//  KSProjectUI
//
//  Created by Serg Bla on 20.03.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSFriendsViewController.h"

#import "FBSDKLoginKit/FBSDKLoginKit.h"

#import "KSUserCell.h"
#import "KSFriendsView.h"
#import "KSDispatch.h"
#import "KSUser.h"
#import "KSUsers.h"
#import "KSUserContext.h"
#import "KSUserAndUserFriendsContext.h"
#import "KSFacebookFriendsContext.h"
#import "KSFriendDetailViewController.h"

#import "UIViewController+KSExtensions.h"

static NSString * const kKSLogoutButtonStyle = @"Log out";

KSViewControllerForViewPropertySyntesize(KSFriendsViewController, KSFriendsView, friendsView);

@implementation KSFriendsViewController

#pragma mark -
#pragma mark Class Methods

+ (Class)cellClass {
    return [KSUserCell class];
}

#pragma mark -
#pragma mark Initializations and Deallocation

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    [self customizeBackBarButton];
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (UITableView *)tableView {
    return self.friendsView.tableView;
}

#pragma mark -
#pragma mark UITableViewDataSource

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    KSFriendDetailViewController *controller = [KSFriendDetailViewController new];
    controller.model = self.items[indexPath.row];
    
    [self.navigationController pushViewController:controller animated:YES];
}

#pragma mark -
#pragma mark Public

- (void)updateViewController {
    [self.tableView reloadData];
    self.friendsView.user = self.model;
}

- (id)itemsLoadingContext {
    return [KSUserAndUserFriendsContext contextWithModel:self.model];
}

- (void)updateModelAdjustment {
    KSUser *user = self.model;
    self.items = user.friends;
}

#pragma mark -
#pragma mark Private 

- (void)customizeBackBarButton {
    UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithTitle:kKSLogoutButtonStyle
                                                               style:UIBarButtonItemStylePlain
                                                              target:self
                                                              action:@selector(onLogout)];
    [self.navigationItem setLeftBarButtonItem:button];
}

- (void)onLogout {
    FBSDKLoginManager *manager = [[FBSDKLoginManager alloc] init];
    [manager logOut];
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
