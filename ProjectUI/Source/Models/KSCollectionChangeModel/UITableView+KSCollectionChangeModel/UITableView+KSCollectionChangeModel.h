//
//  UITableView+KSCollectionChangeModel.h
//  KSProjectUI
//
//  Created by Serg Bla on 17.02.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KSCollectionChangeModel;

@interface UITableView (KSCollectionChangeModel)

- (void)updateWithCollectionChangeModel:(KSCollectionChangeModel *)model;

@end
