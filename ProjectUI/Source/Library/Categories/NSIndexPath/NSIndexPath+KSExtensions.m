//
//  NSIndexPath+KSExtensions.m
//  KSProjectUI
//
//  Created by Serg Bla on 17.02.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "NSIndexPath+KSExtensions.h"

#import <UIKit/UIKit.h>

@implementation NSIndexPath (KSExtensions)

#pragma mark -
#pragma mark Class Methods

+ (instancetype)indexPathForRow:(NSUInteger)row {
    return [self indexPathForRow:row inSection:0];
}

@end
