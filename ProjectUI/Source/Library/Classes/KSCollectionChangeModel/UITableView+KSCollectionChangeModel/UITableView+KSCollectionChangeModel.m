//
//  UITableView+KSCollectionChangeModel.m
//  KSProjectUI
//
//  Created by Serg Bla on 17.02.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "UITableView+KSCollectionChangeModel.h"

#import "KSCollectionChangeModel+UITableView.h"

@implementation UITableView (KSCollectionChangeModel)

#pragma mark -
#pragma mark Public

- (void)updateWithCollectionChangeModel:(KSCollectionChangeModel *)model {
    [model updateTableView:self];
}

@end
