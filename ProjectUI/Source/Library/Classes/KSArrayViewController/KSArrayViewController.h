//
//  KSArrayViewController.h
//  KSProjectUI
//
//  Created by Serg Bla on 20.03.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSViewController.h"

@class KSArrayModel;

@interface KSArrayViewController : KSViewController
@property (nonatomic, strong) KSArrayModel *items;

+ (Class)cellClass;

// this methods should be overload in subclass
- (UITableView *)tableView;
- (id)itemsLoadingContext;

@end
