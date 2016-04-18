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

@interface KSFriendsViewController ()

@end

@implementation KSFriendsViewController

#pragma mark -
#pragma mark Class Methods

+ (Class)cellClass {
    return [KSUserCell class];
}

#pragma mark -
#pragma mark Initializations and Deallocation

- (void)dealloc {
    self.user = nil;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    [self customizeBackBarButton];
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setUser:(KSUser *)user {
    [super setUser:user];
    
    self.items = user.friends;
}

- (UITableView *)tableView {
    return self.friendsView.tableView;
}

#pragma mark -
#pragma mark UITableViewDataSource

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    KSFriendDetailViewController *controller = [KSFriendDetailViewController new];
    controller.user = self.items[indexPath.row];
    
    [self.navigationController pushViewController:controller animated:YES];
}

#pragma mark -
#pragma mark Public

- (void)updateViewController {
    [self.tableView reloadData];
    self.friendsView.user = self.user;
}

- (id)itemsLoadingContext {
    return [KSUserAndUserFriendsContext contextWithModel:self.user];
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
