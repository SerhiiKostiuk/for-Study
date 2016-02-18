//
//  KSArrayDoubleIndexChangeModel+UITableView.m
//  KSProjectUI
//
//  Created by Serg Bla on 17.02.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSArrayDoubleIndexChangeModel+UITableView.h"

#import "NSIndexPath+KSExtensions.h"

#import <UIKit/UITableView.h>
@implementation KSArrayDoubleIndexChangeModel (UITableView)
@dynamic indexPath;

- (NSIndexPath *)indexPath {
    return [NSIndexPath indexPathForRow:self.index];
}

- (void)updateTableView:(UITableView *)tableView {
    [tableView beginUpdates];
    NSIndexPath *indexPath = self.indexPath;
    NSArray *indexPathes = @[indexPath];
    switch (self.changeType) {
        case kKSChangeTypeObjectExchahged:
            [tableView ex
            break;
            
        case kKSChangeTypeObjectMoved:
            [tableView moveRowAtIndexPath:<#(nonnull NSIndexPath *)#> toIndexPath:<#(nonnull NSIndexPath *)#>
            break;
            
        default:
            break;
    }
    [tableView endUpdates];
}

@end
