//
//  KSTableViewCell.m
//  KSProjectUI
//
//  Created by Serg Bla on 09.02.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSTableViewCell.h"

@implementation KSTableViewCell

#pragma mark-
#pragma mark Accessors

- (NSString *)reuseIdentifier {
    return NSStringFromClass([self class]);   
}


@end
