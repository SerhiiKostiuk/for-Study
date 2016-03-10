//
//  KSImageModel.m
//  KSProjectUI
//
//  Created by Serg Bla on 03.03.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSImageModel.h"

#import <Foundation/NSURLSession.h>

#import "NSFileManager+KSExtensions.h"
#import "NSString+KSExtensions.h"

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

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    [self.downloadTask cancel];
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

- (void)setDownloadTask:(NSURLSessionDownloadTask *)downloadTask {
    if (_downloadTask != downloadTask) {
        [downloadTask cancel];
        _downloadTask = downloadTask;
    }
}

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
    NSString *string = nil;
    
    return [string nameFromUrl:self.url];
}


#pragma mark -
#pragma mark Private

- (void)performBackgroundLoading {
    if (!self.cached) {
        [self loadFromInternet];
    } else {
        [self loadFromFile];
    }
 
    @synchronized(self) {
        self.state = KSModelStateFinishedLoading;
    }
}

- (NSString *)imageFolderPath {
    NSString *imageFolderName = [[NSFileManager applicationDataPath] stringByAppendingPathComponent:kKSDirectoryName];
    [[NSFileManager defaultManager] provideDirectoryAtPath:imageFolderName];
    
    return imageFolderName;
}

- (void)loadFromInternet {
    NSURLRequest *request = [self request];
    [self startDowloading:request];
}


- (void)loadFromFile {
    self.image = [UIImage imageWithContentsOfFile:self.path];

}

- (NSURLRequest *)request {
    return [NSURLRequest requestWithURL:self.url];
}

- (NSURLSession *)session {
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration ephemeralSessionConfiguration];
    
    return [NSURLSession sessionWithConfiguration:configuration];
}

- (void)startDowloading:(NSURLRequest *)request {
    NSURLSessionDownloadTask *downloadTask = nil;
    NSURLSession *session = [self session];
    
    downloadTask = [session downloadTaskWithRequest:request
                                  completionHandler:^(NSURL *location,
                                                      NSURLResponse *response,
                                                      NSError *error)
                    {
                        NSFileManager *manager = [NSFileManager defaultManager];
                        [manager moveItemAtURL:location
                                         toURL:[NSURL fileURLWithPath:self.path]
                                         error:nil];
                        
                        [self loadFromFile];
                    }];
    
    [downloadTask resume];
    
    self.downloadTask = downloadTask;
}

@end
