//
//  KSImageModel.m
//  KSProjectUI
//
//  Created by Serg Bla on 03.03.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSImageModel.h"

#import <Foundation/NSURLSession.h>

#import "KSObjectsCache.h"

#import "NSFileManager+KSExtensions.h"
#import "NSString+KSExtensions.h"
#import "NSURL+KSExtensions.h"

#import "KSWeakifyMacro.h"
#import "KSMacro.h"

static NSString * const kKSDirectoryName = @"images";

@interface KSImageModel ()
@property (nonatomic, strong)   UIImage     *image;
@property (nonatomic, readonly) NSString    *path;
@property (nonatomic, readonly) NSString    *imageFolderPath;

@property (nonatomic, strong) NSURLSessionDownloadTask *downloadTask;

@property (nonatomic, assign, getter=isCached) BOOL cached;

- (void)loadFromInternet;
- (void)loadFromFile;
- (NSURLRequest *)request;
- (NSURLSession *)session;
- (void)startDownloading:(NSURLRequest *)request;
- (id)taskCompletion;
- (void)setSynchronizedState:(NSUInteger)state;
- (void)setImageWithNotification:(UIImage *)image;

@end

@implementation KSImageModel

@dynamic cached;
@dynamic path;
@dynamic imageFolderPath;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)imageWithUrl:(NSURL *)url {
    return [[self alloc] initWithUrl:url];
}

+ (KSObjectsCache *)cache {
    static id cache = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        cache = [KSObjectsCache new];
    });
    
    return cache;
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.downloadTask = nil;
}

- (instancetype)init {
    return [self initWithUrl:nil];
}

- (instancetype)initWithUrl:(NSURL *)url {
    KSRerurnNilIfNil(self);
    KSObjectsCache *cache = [[self class] cache];
    id result = cache[url];
    if (result) {
        return result;
    }
    
    self = [super init];
    if (self) {
        self.url = url;
        cache[url] = self;
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setDownloadTask:(NSURLSessionDownloadTask *)downloadTask {
    if (_downloadTask != downloadTask) {
        [_downloadTask cancel];
        
        _downloadTask = downloadTask;
    }
}

- (BOOL)isCached {
    return [[NSFileManager defaultManager] fileExistsAtPath:self.path];
}

- (NSString *)path {
    return [[self imageFolderPath] stringByAppendingPathComponent:[self.url fileSystemStringRepresentation]];
}

- (NSString *)imageFolderPath {
    NSString *imageFolderName = [[NSFileManager applicationDataPath] stringByAppendingPathComponent:kKSDirectoryName];
    [NSFileManager createDirectoryAtPath:imageFolderName];
    
    return imageFolderName;
}

#pragma mark -
#pragma mark Private

- (void)performBackgroundLoading {
    if (!self.cached) {
        [self loadFromInternet];
    } else {
        [self loadFromFile];
    }
}

- (NSURLRequest *)request {
    return [NSURLRequest requestWithURL:self.url];
}

- (void)loadFromInternet {
    [self startDownloading:[self request]];
}

- (void)loadFromFile {
    sleep(2);
    UIImage *image = [UIImage imageWithContentsOfFile:self.path];
    if (image) {
        [self setImageWithNotification:image];
    } else {
        [[NSFileManager defaultManager] removeItemAtPath:self.path error:nil];
        [self loadFromInternet];
    }
}

- (NSURLSession *)session {
    static NSURLSession *session = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration ephemeralSessionConfiguration]];
    });
    
    return session;
}

- (void)startDownloading:(NSURLRequest *)request {
    NSURLSessionDownloadTask *downloadTask = [[self session] downloadTaskWithRequest:request
                                                                   completionHandler:[self taskCompletion]];
    self.downloadTask = downloadTask;
    
    [downloadTask resume];
}

- (id)taskCompletion {
    KSWeakify(self);
    
    return ^(NSURL * location, NSURLResponse * response, NSError * error) {
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
