//
//  KSUserCell.h
//  KSProjectUI
//
//  Created by Serg Bla on 09.02.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KSUser;

@interface KSUserCell : UITableViewCell
@property (nonatomic, strong) IBOutlet UILabel      *userLabel;
@property (nonatomic, strong) IBOutlet UIImageView  *userImageView;

@property (nonatomic, strong) KSUser *user;

@end