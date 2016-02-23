//
//  KSArrayIndexChangeModel+UITableView.m
//  KSProjectUI
//
//  Created by Serg Bla on 17.02.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSArrayIndexChangeModel+UITableView.h"

#import <UIKit/UIKit.h>

#import "NSIndexPath+KSExtensions.h"
#import "UITableView+KSExtensions.h"

@implementation KSArrayIndexChangeModel (UITableView)

@dynamic indexPath;

- (NSIndexPath *)indexPath {
    return [NSIndexPath indexPathForRow:self.index];
}

- (void)updateTableView:(UITableView *)tableView {
    NSIndexPath *indexPath = self.indexPath;
    NSArray *indexPathes = @[indexPath];
    [tableView updateTableView:^(UITableView *object) {
        switch (self.changeType) {
            case kKSChangeTypeObjectAdded:
                [tableView insertRowsAtIndexPaths:indexPathes
                                 withRowAnimation:UITableViewRowAnimationTop];
                break;
                
            case kKSChangeTypeObjectRemoved:
                [tableView deleteRowsAtIndexPaths:indexPathes
                                 withRowAnimation:UITableViewRowAnimationLeft];
                break;
                
            default:
                break;
        }
    }];
    
    if (kKSChangeTypeObjectAdded == self.changeType) {
        [tableView scrollToRowAtIndexPath:indexPath
                         atScrollPosition:UITableViewScrollPositionNone
                                 animated:YES];
    }
}

@end
