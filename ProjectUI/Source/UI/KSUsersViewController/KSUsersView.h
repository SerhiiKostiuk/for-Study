//
//  KSUserVIew.h
//  KSProjectUI
//
//  Created by Serg Bla on 08.02.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "KSView.h"
#import "KSActivityIndicator.h"

@interface KSUsersView : KSView
@property (nonatomic, strong) IBOutlet UITableView  *tableView;

- (IBAction)onSwipeRight:(UISwipeGestureRecognizer *)sender;
- (IBAction)onSwipeLeft:(UISwipeGestureRecognizer *)sender;

@end
