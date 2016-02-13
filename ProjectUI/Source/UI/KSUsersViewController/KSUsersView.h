//
//  KSUserVIew.h
//  KSProjectUI
//
//  Created by Serg Bla on 08.02.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KSUsersView : UIView
@property (nonatomic, strong) IBOutlet UITableView  *tableView;

- (IBAction)onSwipeRight:(UISwipeGestureRecognizer *)sender;
- (IBAction)onSwipeLeft:(UISwipeGestureRecognizer *)sender;

@end
