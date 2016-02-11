//
//  KSUserVIewController.h
//  KSProjectUI
//
//  Created by Serg Bla on 08.02.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KSUsers;

@interface KSUserViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) KSUsers *users;

- (IBAction)onAddNewUser:(id)sender;

@end
