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

- (NSString *)KSPathForLibraryDirectory {
    return NSSearchPathForDirectory(NSLibraryDirectory);
}

- (NSString *)KSPathForDocumentDirectory {
    return NSSearchPathForDirectory(NSDocumentDirectory);
}

- (NSString *)KSPathForProjectFolderDirectory {
    return [[self KSPathForLibraryDirectory] stringByAppendingPathComponent:kKSDirectoryName] ;
}

@end
