//
//  KSArrayDoubleIndexChangeModel+UITableView.m
//  KSProjectUI
//
//  Created by Serg Bla on 17.02.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSArrayDoubleIndexChangeModel+UITableView.h"

#import <UIKit/UITableView.h>

#import "NSIndexPath+KSExtensions.h"
#import "UITableView+KSExtensions.h"
#import "KSArrayIndexChangeModel+UITableView.h"

@implementation KSArrayDoubleIndexChangeModel (UITableView)

@dynamic toIndexPath;

- (NSIndexPath *)toIndexPath {
    return [NSIndexPath indexPathForRow:self.toIndex];
}

- (void)updateTableView:(UITableView *)tableView {
    [tableView updateTableView:^(UITableView *object) {
        NSIndexPath *indexPath = self.indexPath;
        NSIndexPath *toIndexPath = self.toIndexPath;
        NSArray *indexPathes = @[indexPath];
        NSArray *toIndexPathes = @[toIndexPath];
        
        switch (self.changeType) {
            case kKSChangeTypeObjectExchahged:
                [tableView deleteRowsAtIndexPaths:indexPathes withRowAnimation:UITableViewRowAnimationRight];
                [tableView insertRowsAtIndexPaths:toIndexPathes withRowAnimation:UITableViewRowAnimationLeft];
                break;
                
            case kKSChangeTypeObjectMoved:
                [tableView moveRowAtIndexPath:indexPath toIndexPath:toIndexPath];
                break;
                
            default:
                break;
        }
    }];
}

@end
