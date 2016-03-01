//
//  KSUsers.m
//  KSProjectUI
//
//  Created by Serg Bla on 10.02.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSUsers.h"

#import "KSUser.h"

#import "NSPathUtilities+KSExtensions.h"
#import "NSFileManager+KSExtensions.h"
#import "NSObject+KSExtensions.h"

#import "KSWeakifyMacro.h"

static const NSUInteger kKSUsersCount = 100;

static NSString * const kKSPListName  = @"users.plist";

@interface KSUsers ()
@property (nonatomic, assign, getter=isCashed) BOOL cashed;

@property (nonatomic, copy) NSString  *path;

- (void)fillWithUsers:(NSArray *)objects;
- (NSString *)path;

@end

@implementation KSUsers

@dynamic cashed;

#pragma mark -
#pragma mark Accessors

- (NSString *)path {
    return [[NSFileManager applicationDataPath] stringByAppendingPathComponent:kKSPListName];
}

- (BOOL)isCashed {
    NSFileManager *manager = [NSFileManager  defaultManager];
    
    return [manager fileExistsAtPath:self.path];
}

#pragma mark -
#pragma mark Public

- (void)save {
    [NSKeyedArchiver archiveRootObject:self.objects toFile:self.path];
}

#pragma mark -
#pragma mark Private

- (void)performBackgroundLoading {
    NSArray *objects = [NSKeyedUnarchiver unarchiveObjectWithFile:self.path];
    if (objects) {
        [self fillWithUsers:objects];
    } else {
        [self fillWithUsers:[KSUser objectsWithCount:kKSUsersCount]];
    }
    
    sleep(2);
    @synchronized(self) {
        self.state = KSModelStateFinishedLoading;
    }
}

- (void)fillWithUsers:(NSArray *)objects {
    KSWeakify(self);
    [self performBlockWithoutNotification:^{
        KSStrongifyAndReturnIfNil(self);
        for (KSUser *user in objects) {
            [self addObject: user];
        }
    }];
}

@end
