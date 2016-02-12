//
//  KSUserVIewController.m
//  KSProjectUI
//
//  Created by Serg Bla on 08.02.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSUserViewController.h"

#import "KSUsersView.h"
#import "KSUserCell.h"
#import "KSUsers.h"
#import "KSUser.h"

#import "UIViewController+KSExtensions.h"
#import "UITableView+KSExtensions.h"

KSCategoryForViewProperty(KSUserViewController, KSUsersView, mainView);

@implementation KSUserViewController

#pragma mark -
#pragma mark Accessors

- (void)setUsers:(KSUsers *)users {
    if (_users != users) {
        _users = users;
        
        [self.mainView.tableView reloadData];
    }
}

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.mainView.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark Interface Handling

- (IBAction)onAddNewUser:(id)sender {
    [self.users addObject:[KSUser new]];
    [self.mainView.tableView reloadData];
}

- (IBAction)onEdit:(id)sender {
    self.mainView.tableView.editing = YES;
    
}

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.users.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    KSUserCell *cell = [tableView cellWithClass:[KSUserCell class]];
    cell.user = [self.users objectAtIndex:indexPath.row];
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)    tableView:(UITableView *)tableView
   moveRowAtIndexPath:(nonnull NSIndexPath *)sourceIndexPath
          toIndexPath:(nonnull NSIndexPath *)destinationIndexPath
{

}

@end
