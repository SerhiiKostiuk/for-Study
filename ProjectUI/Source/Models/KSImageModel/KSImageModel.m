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

typedef void(^KSVoidBlock)(void);

static NSString * const kKSStringURL = @"http://geographyofrussia.com/wp-content/uploads/2010/07/3_large1.png";

static NSString * const kKSDirectoryName = @"images";

@interface KSImageModel ()
@property (nonatomic, strong) UIImage     *image;
@property (nonatomic, strong) NSString    *name;
@property (nonatomic, strong) NSURL       *url;
@property (nonatomic, copy)   NSString    *path;

@property (nonatomic, strong) NSURLSessionDownloadTask *downloadTask;

@property (nonatomic, assign, getter=isCached) BOOL cached;

- (NSString *)imageFolderPath;

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
    return [[self imageFolderPath] stringByAppendingPathComponent:self.name];
}

- (NSURL *)url {
    return [NSURL URLWithString:kKSStringURL];
};

- (NSString *)name {
    [self.url.path stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLUserAllowedCharacterSet]];
    
    return nil;
}

#pragma mark -
#pragma mark Private

- (void)performBackgroundLoading {

    if (!self.cached) {
        NSURLRequest *request = [NSURLRequest requestWithURL:self.url];
        [self downloadTaskWithDecidedRequest:request completionHandler:nil];
        
    } else {
        self.image = [UIImage imageWithContentsOfFile:self.path];
    }
 
    @synchronized(self) {
        self.state = KSModelStateFinishedLoading;
    }
}

- (NSString *)imageFolderPath {
    return [[NSFileManager applicationDataPath] stringByAppendingPathComponent:kKSDirectoryName];
}

- (NSURLSession *)sessionWithDecidedConfiguration:(NSURLSessionConfiguration *)decidedConfiguration {
    return [NSURLSession sessionWithConfiguration:decidedConfiguration];
}

- (NSURLSessionDownloadTask *)downloadTaskWithDecidedRequest:(NSURLRequest *)request
                                           completionHandler:(KSVoidBlock)completionHandler
{
    NSURLSessionDownloadTask *downloadTask = self.downloadTask;
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration ephemeralSessionConfiguration];
    NSURLSession *session = [self sessionWithDecidedConfiguration:configuration];
    
    
    self.downloadTask = [session downloadTaskWithRequest:request
                                       completionHandler:^(NSURL *location,
                                                           NSURLResponse *response,
                                                           NSError *error)
                         {
                             NSFileManager *manager = [NSFileManager defaultManager];
                             [manager moveItemAtURL:location
                                              toURL:[NSURL fileURLWithPath:self.path]
                                              error:nil];
                         }];
    
    [downloadTask resume];
    
    return downloadTask;
}

//- (NSURLSessionConfiguration *)sessionConfiguration:(NSURLSessionConfiguration *)decidedConfiguration {
//    return [NSURLSessionConfiguration decidedConfiguration];
//}

@end
