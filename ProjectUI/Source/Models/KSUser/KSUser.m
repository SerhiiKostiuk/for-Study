//
//  KSUser.m
//  KSProjectUI
//
//  Created by Serg Bla on 09.02.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSUser.h"

#import "NSString+KSRandomName.h"

static NSString * const kKSImageName = @"apple";
static NSString * const kKSImageType = @"png";

static NSString * const kKSNameKey = @"name";

@interface KSUser ()
@property (nonatomic, strong) UIImage *image;

@end

@implementation KSUser

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];    
    if (self) {
        self.name = [NSString randomName];
    }
    
    return self;
}

#pragma mark -
#pragma mark Private

- (void)performBackgroundLoading {
    sleep(2);
    
    static UIImage *__image = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __image = [UIImage imageNamed:kKSImageName];
    });
    
    self.image = __image;
    
    @synchronized(self) {
        self.state = KSModelStateFinishedLoading;
    }
}

#pragma mark -
#pragma mark NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.name forKey:kKSNameKey];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self.name = [aDecoder decodeObjectForKey:kKSNameKey];
    
    return self;
}

@end
