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

@implementation UITableView (KSExtensions)

- (id)cellWithClass:(Class)aClass {
    id cell = [self dequeueReusableCellWithIdentifier:NSStringFromClass(aClass)];
    if (!cell) {
        cell = [UINib objectWithClass:aClass];
    }
    
    return cell;
}

@end
