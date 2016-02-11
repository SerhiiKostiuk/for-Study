//
//  KSUserVIewController.m
//  KSProjectUI
//
//  Created by Serg Bla on 08.02.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSUserViewController.h"

#import "KSUserView.h"
#import "KSUserCell.h"
#import "KSUsers.h"
#import "KSUser.h"

#import "UIViewController+KSExtensions.h"
#import "UINib+KSExtensions.h"

#define reloadData [self.mainView.usersView reloadData]

KSCategoryForViewProperty(KSUserViewController, KSUserView, mainView);

@implementation KSUserViewController

#pragma mark -
#pragma mark Accessors

- (void)setUsers:(KSUsers *)users {
    if (_users != users) {
        _users = users;
        
        reloadData;
    }
}

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    reloadData;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark Interface Handling

- (IBAction)onAddNewUser:(id)sender {
    [self.users addObject:[KSUser new]];
    reloadData;
}


#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.users.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Class class = [KSUserCell class];
    NSString *classString = NSStringFromClass(class);
    
    KSUserCell *cell = [tableView dequeueReusableCellWithIdentifier:classString];
    if (!cell) {
        cell = [UINib objectWithClass:class];
    }
    
    cell.user = [self.users objectAtIndex:indexPath.row];
    
    return cell;
}

@end
