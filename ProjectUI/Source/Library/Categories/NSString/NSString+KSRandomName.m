//
//  NSString+KSRandomName.m
//  KSProjectUI
//
//  Created by Serg Bla on 09.02.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "NSString+KSRandomName.h"

#import "NSString+KSExtensions.h"

static NSUInteger const kKSRandomNameLehgth = 10;
@implementation NSString (KSRandomName)

+ (instancetype)randomName {
    return [NSString randomStringWithLength:kKSRandomNameLehgth alphabet:[NSString lowercaseLetters]];
}
@end
