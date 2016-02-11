//
//  UINib+KSExtensions.h
//  KSProjectUI
//
//  Created by Serg Bla on 10.02.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINib (KSExtensions)

+ (UINib *)nibWithClass:(Class)aClass;
+ (UINib *)nibWithClass:(Class)aClass bundle:(NSBundle *)bundle;

+ (id)objectWithClass:(Class)aClass;
+ (id)objectWithClass:(Class)aClass owner:(id)owner;
+ (id)objectWithClass:(Class)aClass owner:(id)owner options:(NSDictionary *)options;

- (id)objectWithClass:(Class)aClass;
- (id)objectWithClass:(Class)aClass owner:(id)owner;
- (id)objectWithClass:(Class)aClass owner:(id)owner options:(NSDictionary *)options;

@end
