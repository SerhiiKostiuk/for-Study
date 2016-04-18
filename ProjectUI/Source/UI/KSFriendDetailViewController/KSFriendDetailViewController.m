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

@implementation KSFriendDetailViewController

#pragma mark -
#pragma mark Public

- (void)updateViewController {
    self.friendDetailView.user = self.model;
}

- (id)itemsLoadingContext {
    return [KSUserDetailContext contextWithModel:self.model];
}

- (void)updateModelAdjustment {
    self.context = [self itemsLoadingContext];
}

@end
