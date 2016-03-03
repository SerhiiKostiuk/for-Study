//
//  NSFileManager+KSExtensions.m
//  KSProjectUI
//
//  Created by Serg Bla on 24.02.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "NSFileManager+KSExtensions.h"

#import "NSPathUtilities+KSExtensions.h"

static NSString * const kKSDirectoryName = @"projectFolder";

@implementation NSFileManager (KSExtensions)

+ (NSString *)libraryPath {
    return NSSearchPathForDirectory(NSLibraryDirectory);
}

+ (NSString *)documentPath {
    return NSSearchPathForDirectory(NSDocumentDirectory);
}

+ (NSString *)applicationDataPath {
    return [[self libraryPath] stringByAppendingPathComponent:kKSDirectoryName];
}

- (void)provideDirectoryAtPath:(NSString *)path {
    NSFileManager *manager = [NSFileManager  defaultManager];
    if (![manager fileExistsAtPath:path]) {
        [manager createDirectoryAtPath:path
           withIntermediateDirectories:YES
                            attributes:nil
                                 error:nil];
    }
}

@end
