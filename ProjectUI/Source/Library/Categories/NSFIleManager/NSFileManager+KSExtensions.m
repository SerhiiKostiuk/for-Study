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

#define KSReturnDirectoryAtPath(path)\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{ [self createDirectoryAtPath:path]; });\
return path;

#define KSReturnDirectoryAtSearchPath(searchPath) KSReturnDirectoryAtPath(NSSearchPathForDirectory(searchPath));

+ (NSString *)libraryPath {
    KSReturnDirectoryAtSearchPath(NSLibraryDirectory);
}

+ (NSString *)documentPath {
    KSReturnDirectoryAtSearchPath(NSDocumentDirectory);
}

+ (NSString *)applicationDataPath {
   KSReturnDirectoryAtPath([[self libraryPath] stringByAppendingPathComponent:kKSDirectoryName]);
}

+ (void)createDirectoryAtPath:(NSString *)path {
    NSFileManager *manager = [NSFileManager  defaultManager];
    if (![manager fileExistsAtPath:path]) {
        [manager createDirectoryAtPath:path
           withIntermediateDirectories:YES
                            attributes:nil
                                 error:nil];
    }
}

#undef KSReturnDirectoryAtPath
#undef KSReturnDirectoryAtSearchPath

@end
