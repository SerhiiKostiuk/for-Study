//
//  KSImageModel.m
//  KSProjectUI
//
//  Created by Serg Bla on 03.03.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSImageModel.h"

#import <Foundation/NSURLSession.h>

#include "NSFileManager+KSExtensions.h"

@interface KSImageModel ()
@property (nonatomic, strong) UIImage   *image;
@property (nonatomic, strong) NSString  *name;
@property (nonatomic, strong) NSURL     *url;
@property (nonatomic, copy) NSString    *path;

@property (nonatomic, assign, getter=isCached) BOOL cached;

@end

@implementation KSImageModel

@dynamic cached;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)imageWithUrl:(NSURL *)url {
    return [[self alloc] initWithUrl:url];
}

- (instancetype)initWithUrl:(NSURL *)url {
    self = [super init];
    if (self) {
        self.url = url;
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (BOOL)isCached {
    NSFileManager *manager = [NSFileManager  defaultManager];
    
    return [manager fileExistsAtPath:self.path];
}

- (NSString *)path {
    return [[NSFileManager applicationDataPath] stringByAppendingPathComponent:self.name];
}

- (NSURL *)url {
    return [NSURL URLWithString:@"http://geographyofrussia.com/wp-content/uploads/2010/07/3_large1.png"];
};

- (NSString *)name {
//    - (NSString *)stringByAddingPercentEncodingWithAllowedCharacters:(NSCharacterSet *)allowedCharacters;
    
//    - (BOOL)getFileSystemRepresentation:(char *)buffer maxLength:(NSUInteger)maxBufferLength;

    return nil;
}

#pragma mark -
#pragma mark Private

- (void)performBackgroundLoading {
    UIImage *image = self.image;
    
    if (!self.cached) {
        NSData *imageData = [NSData dataWithContentsOfURL:self.url];
        image = [UIImage imageWithData:imageData];
    } else {
        image = [NSKeyedUnarchiver unarchiveObjectWithFile:self.path];
    }
    
    @synchronized(self) {
        self.state = KSModelStateFinishedLoading;
    }
}

- (void)cancel {
    self.image = nil;
    self.state = KSModelStateUnloaded;
}

@end
