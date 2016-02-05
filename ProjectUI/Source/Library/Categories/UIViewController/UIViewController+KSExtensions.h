//
//  UIViewController+KSExtensions.h
//  KSProjectUI
//
//  Created by Serg Bla on 04.02.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import <UIKit/UIKit.h>

#define KSViewControllerViewPropertySyntesize(viewClass, propertyName) \
@property (nonatomic, strong) viewClass *propertyName;

#define KSViewControllerViewGetterSynthesize(viewClass, propertyName) \
    - (viewClass *)propertyName { \
        if ([self isViewLoaded] && [self.view isKindOfClass:[viewClass class]]) { \
            return (viewClass *)self.view; \
        } \
        \
        return nil; \
    }

#define KSCategoryForViewProperty(controllerName, viewClass, propertyName) \
    \
    @interface controllerName (_KSViewControllerProperty__##controllerName##__##viewClass##__##propertyName) \
    KSViewControllerViewPropertySyntesize(viewClass, propertyName) \
    \
    @end \
    \
    @implementation controllerName (_KSViewControllerProperty__##controllerName##__##viewClass##__##propertyName) \
    \
    @dynamic propertyName; \
    \
    KSViewControllerViewGetterSynthesize(viewClass, propertyName) \
    \
    @end

@interface UIViewController (KSExtensions)

@end
