//
//  KSWaitActivityView.m
//  KSProjectUI
//
//  Created by Serg Bla on 25.02.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSActivityIndicator.h"

#import "UINib+KSExtensions.h"

@implementation KSActivityIndicator

+ (instancetype)indicatorWithSuperView:(UIView *)superView {
    KSActivityIndicator *view = [UINib objectWithClass:[self class]];
    view.frame = superView.bounds;
    view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [superView addSubview:view];
    
    return view;
}

@end
