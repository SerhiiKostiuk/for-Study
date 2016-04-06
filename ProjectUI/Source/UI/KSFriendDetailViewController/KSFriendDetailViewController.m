//
//  KSFriendDetailViewController.m
//  KSProjectUI
//
//  Created by Serg Bla on 20.03.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSFriendDetailViewController.h"
#import "KSUserDetailContext.h"
#import "KSFriendDetailView.h"
#import "KSUser.h"

#import "UIViewController+KSExtensions.h"

KSViewControllerForViewPropertySyntesize(KSFriendDetailViewController, KSFriendDetailView, friendDetailView);

@interface KSFriendDetailViewController ()

@end

@implementation KSFriendDetailViewController

#pragma mark -
#pragma mark Accessors

- (void)setUser:(KSUser *)user {
    if (_user != user) {
        [_user removeObserver:self];
        _user = user;
        [_user addObserver:self];
        
        self.context = [self itemsLoadingContext];
        
    }
}

#pragma mark-
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self updateViewController];
  }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   }


#pragma mark -
#pragma mark Public

- (void)updateViewController {
    self.friendDetailView.user = self.user;
}

- (id)itemsLoadingContext {
    return [KSUserDetailContext contextWithModel:self.user];
}

@end
