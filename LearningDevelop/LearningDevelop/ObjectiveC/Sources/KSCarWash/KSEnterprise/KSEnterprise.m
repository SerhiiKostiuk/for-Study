//
//  KSEnterprise.m
//  LearningDevelop
//
//  Created by Serg Bla on 08.12.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import "employee.h"
#import "KSEnterprise.h"

@implementation KSEnterprise

+ (BOOL)canContainItemOfClass:(Class)itemClass {
    return [itemClass isSubclassOfClass:[employee class]];
}


@end
