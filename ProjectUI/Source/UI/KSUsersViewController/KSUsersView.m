//
//  KSUserVIew.m
//  KSProjectUI
//
//  Created by Serg Bla on 08.02.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSUsersView.h"

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
#pragma mark Private

- (void)swipeForShowEditingStyle:(UISwipeGestureRecognizer *)sender editing:(BOOL)editing {
    UITableView *tableView = self.tableView;
    if (UIGestureRecognizerStateRecognized == sender.state) {
        [tableView setEditing:editing animated:YES];
    }
}

@end
