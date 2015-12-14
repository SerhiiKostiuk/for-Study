//
//  buildings.m
//  LearningDevelop
//
//  Created by Serg Bla on 12.12.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import "buildings.h"
#import "employee.h"

@implementation buildings

+ (BOOL)canContainItemOfClass:(Class)itemClass {
    return [itemClass isSubclassOfClass:[employee class]];
}

@end
