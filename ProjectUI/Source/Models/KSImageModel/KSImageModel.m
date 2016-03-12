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
#import "NSURL+KSExtensions.h"

#import "KSWeakifyMacro.h"

static NSString * const kKSDirectoryName = @"images";

@interface KSImageModel ()
@property (nonatomic, strong) UIImage     *image;
@property (nonatomic, strong) NSString    *name;
@property (nonatomic, strong) NSURL       *url;
@property (nonatomic, copy)   NSString    *path;

@property (nonatomic, strong) NSURLSessionDownloadTask *downloadTask;

@property (nonatomic, assign, getter=isCached) BOOL cached;

- (NSString *)imageFolderPath;
- (void)loadFromInternet;
- (void)loadFromFile;
- (NSURLRequest *)request;
- (NSURLSession *)session;
- (void)startDowloading:(NSURLRequest *)request;
- (id)taskCompletion;
- (void)setSynchronizedState:(NSUInteger)state;
- (void)setImageWithNotification:(UIImage *)image;

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
    self.downloadTask = nil;
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
    return [[NSFileManager defaultManager] fileExistsAtPath:self.path];
}

- (NSString *)path {
    return [[self imageFolderPath] stringByAppendingPathComponent:[self.url fileSystemStringRepresentation]];
}

//- (NSString *)name {
//    return [self.url fileSystemStringRepresentation];
//}

#pragma mark -
#pragma mark Private

- (void)performBackgroundLoading {
    if (!self.cached) {
        [self loadFromInternet];
    } else {
        [self loadFromFile];
    }
}

- (NSString *)imageFolderPath {
    NSString *imageFolderName = [[NSFileManager applicationDataPath] stringByAppendingPathComponent:kKSDirectoryName];
    [[NSFileManager defaultManager] provideDirectoryAtPath:imageFolderName];
    
    return imageFolderName;
}

- (void)loadFromInternet {
    [[NSFileManager defaultManager] removeItemAtPath:self.path error:nil];
    
    NSURLRequest *request = [self request];
    [self startDowloading:request];
}

- (void)loadFromFile {
    UIImage  *image = [UIImage imageWithContentsOfFile:self.path];
    if (image) {
        [self setImageWithNotification:image];
    } else {
        [self loadFromInternet];
    }

}

- (NSURLRequest *)request {
    return [NSURLRequest requestWithURL:self.url];
}

- (NSURLSession *)session { 
    static NSURLSession *session = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration ephemeralSessionConfiguration]];
    });
    
    return session;
}

- (void)startDowloading:(NSURLRequest *)request {
//    NSURLSessionDownloadTask *downloadTask = nil;
    NSURLSession *session = [self session];
    
    NSURLSessionDownloadTask *downloadTask = [session downloadTaskWithRequest:request
                                  completionHandler:[self taskCompletion]];
    
    self.downloadTask = downloadTask;

    [downloadTask resume];
}

- (id)taskCompletion {
    KSWeakify(self);
    
    return ^(NSURL *location, NSURLResponse *response, NSError *error) {
        KSStrongifyAndReturnIfNil(self);
        if (error) {
            [self setSynchronizedState:KSModelStateFailedLoading];
            return;
        }
        
        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:location]];
        if (image) {
            [[NSFileManager defaultManager] moveItemAtURL:location
                                                    toURL:[NSURL fileURLWithPath:self.path]
                                                    error:nil];
        }
        
        [self setImageWithNotification:image];
    };
}

- (void)setSynchronizedState:(NSUInteger)state {
    @synchronized(self) {
        self.state = state;
    }
}

- (void)setImageWithNotification:(UIImage *)image {
    self.image = image;
    [self setSynchronizedState:image ? KSModelStateFinishedLoading : KSModelStateFailedLoading];
}

@end
