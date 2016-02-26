//
//  KSUserVIew.m
//  KSProjectUI
//
//  Created by Serg Bla on 08.02.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSUsersView.h"

#import "KSActivityIndicator.h"

@interface KSUsersView ()
@property (nonatomic, strong) KSActivityIndicator *activityIndicator;

@end

@implementation KSUsersView

#pragma mark -
#pragma mark Interface Handling

- (IBAction)onSwipeRight:(UISwipeGestureRecognizer *)sender {
    [self swipeForShowEditingStyle:sender editing:YES];
}

- (IBAction)onSwipeLeft:(UISwipeGestureRecognizer *)sender {
    [self swipeForShowEditingStyle:sender editing:NO];
}

#pragma mark -
#pragma mark Public

- (void)showActivityIndicator {
    [KSActivityIndicator indicatorWithSuperView:self];
    [self assignAlpha:1.0];
}

- (void)hideActivityIndicator {
//    [self.activityIndicator.activityIndicatorView stopAnimating];
    [self assignAlpha:0.0];
}

#pragma mark -
#pragma mark Private

- (void)swipeForShowEditingStyle:(UISwipeGestureRecognizer *)sender editing:(BOOL)editing {
    UITableView *tableView = self.tableView;
    if (UIGestureRecognizerStateRecognized == sender.state) {
        [tableView setEditing:editing animated:YES];
    }
}

- (void)assignAlpha:(CGFloat)alpha {
    self.activityIndicator.activityIndicatorView.alpha = alpha;
}

@end
