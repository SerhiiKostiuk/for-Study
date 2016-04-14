//
//  UIAlertView+KSExtensions.h
//  KSProjectUI
//
//  Created by Serg Bla on 14.04.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import <UIKit/UIAlertView.h>

@interface UIAlertView (KSExtensions)

+ (void)presentWithError:(NSError *)error;

@end
