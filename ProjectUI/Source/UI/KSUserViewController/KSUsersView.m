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
    UITableView *tableView = self.tableView;
    if (UIGestureRecognizerStateRecognized == sender.state) {
        [tableView setEditing:YES animated:YES];
    }
}

- (IBAction)onSwipeLeft:(UISwipeGestureRecognizer *)sender {
    UITableView *tableView = self.tableView;
    if (UIGestureRecognizerStateEnded == sender.state) {
        [tableView setEditing:NO animated:YES];
    }
}

@end
