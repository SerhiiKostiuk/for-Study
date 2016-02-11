//
//  KSUserVIew.m
//  KSProjectUI
//
//  Created by Serg Bla on 08.02.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSUserView.h"

@implementation KSUserView

- (IBAction)OnSwipe:(UISwipeGestureRecognizer *)sender {
    UITableView *usersView = self.usersView;
    if (UIGestureRecognizerStateBegan == sender.state) {
        [usersView setEditing:YES animated:YES];
    }
}

@end
