//
//  UIViewController+KSExtensions.h
//  KSProjectUI
//
//  Created by Serg Bla on 04.02.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import <UIKit/UIKit.h>

#define KSViewGetterSynthesize(viewClass, selectorName) \
    - (viewClass *)selectorName { \
        if ([self isViewLoaded] && [self.view isKindOfClass:[viewClass class]]) { \
            return (viewClass *)self.view; \
        } \
        \
        return nil; \
    }

@interface UIViewController (KSExtensions)

@end
