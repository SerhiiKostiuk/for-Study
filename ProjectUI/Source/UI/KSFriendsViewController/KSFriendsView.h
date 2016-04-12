//
//  KSFriendsView.h
//  KSProjectUI
//
//  Created by Serg Bla on 20.03.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSView.h"

@class KSUser;
@class KSImageView;

@interface KSFriendsView : KSView
@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, strong) IBOutlet KSImageView *imageView;
@property (nonatomic, strong) IBOutlet UILabel     *nameLabel;

@property (nonatomic, strong) KSUser *user;


@end
