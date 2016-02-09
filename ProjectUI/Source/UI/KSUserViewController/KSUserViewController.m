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

#import "UIViewController+KSExtensions.h"

KSCategoryForViewProperty(KSUserViewController, KSUserView, mainView);

@implementation KSUserViewController

#pragma mark -
#pragma mark Accessors

- (void)setUsers:(KSUsers *)users {
    if (_users != users) {
        _users = users;
        
        [self.mainView.usersView reloadData];
    }
}

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.mainView.usersView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark -
#pragma mark UITableViewDataSource


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Class class = [KSUserCell class];
    NSString *classString = NSStringFromClass(class);
    KSUserCell *cell = [tableView dequeueReusableCellWithIdentifier:classString];
    if (!cell) {
        UINib *nib = [UINib nibWithNibName:classString bundle:nil];
        NSArray *cells = [nib instantiateWithOwner:nil options:nil];
        for (KSUserCell *result in cells) {
            if ([result isMemberOfClass:class]) {
                cell = result;
                break;
            }
        }
    }
    cell.user = self.users[indexPath.row];
    
    return cell;
}

@end
