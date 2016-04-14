//
//  UIAlertView+KSExtensions.m
//  KSProjectUI
//
//  Created by Serg Bla on 14.04.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "UIAlertView+KSExtensions.h"

static NSString * const kKSCancelButtonTitle = @"Ok";
static NSString * const kKSErrorTitle = @"Error";

@implementation UIAlertView (KSExtensions)

+ (void)presentWithError:(NSError *)error {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:kKSErrorTitle
                                                    message:[error localizedDescription]
                                                   delegate:nil
                                          cancelButtonTitle:kKSCancelButtonTitle
                                          otherButtonTitles:nil];
    [alert show];
}

@end
