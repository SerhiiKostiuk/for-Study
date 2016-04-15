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
#pragma mark Initializations and Deallocation

- (void)dealloc {
    self.user = nil;
}

#pragma mark -
#pragma mark Accessors

- (void)setUser:(KSUser *)user {
    [super setUser:user];
    self.context = [self itemsLoadingContext];
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
