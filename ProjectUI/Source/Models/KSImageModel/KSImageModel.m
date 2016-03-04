//
//  KSImageModel.m
//  KSProjectUI
//
//  Created by Serg Bla on 03.03.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSImageModel.h"

@interface KSImageModel ()
@property (nonatomic, strong) UIImage  *image;
@property (nonatomic, strong) NSURL    *url;

@property (nonatomic, assign, getter=isLoaded) BOOL loaded;

@end

@implementation KSImageModel

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

- (BOOL)isLoaded {
    return nil != self.image;
}

#pragma mark -
#pragma mark Public

- (void)load {
    
}

- (void)performBackgroundLoading {
    
}

- (void)cancel {
    self.image = nil;
    self.state = KSModelStateUnloaded;
}

@end
