//
//  ExtensionsForNSObject.m
//  LearningDevelop
//
//  Created by Serg Bla on 27.11.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import "CategoryForNSObject.h"

@implementation NSObject (KSExtensions)

+(instancetype)object {
    return [[[self alloc] init] autorelease];
}

@end
