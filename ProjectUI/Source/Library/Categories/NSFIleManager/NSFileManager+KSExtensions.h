//
//  NSFileManager+KSExtensions.h
//  KSProjectUI
//
//  Created by Serg Bla on 24.02.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (KSExtensions)

+ (NSString *)libraryPath;
+ (NSString *)documentPath;
+ (NSString *)applicationDataPath;

- (void)provideDirectoryAtPath:(NSString *)path;

@end
