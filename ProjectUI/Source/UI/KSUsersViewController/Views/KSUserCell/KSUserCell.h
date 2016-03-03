//
//  KSUserCell.h
//  KSProjectUI
//
//  Created by Serg Bla on 09.02.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "KSTableViewCell.h"
#import "KSView.h"

@class KSUser;

@interface KSUserCell : KSTableViewCell
@property (nonatomic, strong) IBOutlet UILabel          *label;
@property (nonatomic, strong) IBOutlet UIImageView      *contentImageView;
@property (nonatomic, strong) IBOutlet KSView           *loadingView;

@property (nonatomic, strong) KSUser *user;

@end
