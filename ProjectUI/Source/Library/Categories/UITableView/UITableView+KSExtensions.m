//
//  UITableView+KSExtensions.m
//  KSProjectUI
//
//  Created by Serg Bla on 12.02.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "UITableView+KSExtensions.h"

#import "KSUserCell.h"

#import "UINib+KSExtensions.h"
#import "KSMacro.h"

@implementation UITableView (KSExtensions)

#pragma mark -
#pragma mark Public

- (id)cellWithClass:(Class)aClass {
    id cell = [self dequeueReusableCellWithIdentifier:NSStringFromClass(aClass)];
    if (!cell) {
        cell = [UINib objectWithClass:aClass];
    }
    
    return cell;
}

- (void)updateTableView:(void(^)(UITableView *))block {
    KSRerurnIfNil(block);
    
    [self beginUpdates];
    block(self);
    [self endUpdates];
}

@end
