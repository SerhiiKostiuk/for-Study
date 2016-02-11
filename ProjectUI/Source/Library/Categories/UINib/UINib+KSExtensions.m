//
//  UINib+KSExtensions.m
//  KSProjectUI
//
//  Created by Serg Bla on 10.02.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "UINib+KSExtensions.h"

@implementation UINib (KSExtensions)

#pragma mark -
#pragma mark Class Methods

+ (UINib *)nibWithClass:(Class)aClass {
    return [self nibWithClass:aClass bundle:nil];
}
+ (UINib *)nibWithClass:(Class)aClass bundle:(NSBundle *)bundle {
    return [self nibWithNibName:NSStringFromClass(aClass) bundle:bundle];
}

+ (id)objectWithClass:(Class)aClass {
    return [self objectWithClass:aClass owner:nil];
}

+ (id)objectWithClass:(Class)aClass owner:(id)owner {
    return [self objectWithClass:aClass owner:owner options:nil];
}

+ (id)objectWithClass:(Class)aClass owner:(id)owner options:(NSDictionary *)options {
    return [[self nibWithClass:aClass] objectWithClass:aClass owner:owner options:options];
}

#pragma mark -
#pragma mark Public

- (id)objectWithClass:(Class)aClass {
    return [self objectWithClass:aClass owner:nil];
}

- (id)objectWithClass:(Class)aClass owner:(id)owner {
    return [self objectWithClass:aClass owner:nil options:nil];
}

- (id)objectWithClass:(Class)aClass owner:(id)owner options:(NSDictionary *)options {
    NSArray *objects = [self instantiateWithOwner:owner options:options];
    for (id result in objects) {
        if ([result isMemberOfClass:aClass]) {
            return result;
        }
    }
    
    return nil;
}

@end
