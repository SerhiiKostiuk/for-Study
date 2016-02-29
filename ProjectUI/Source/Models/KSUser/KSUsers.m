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
#import "KSDispatch.h"
//#import "KSModel.h"

#import "KSWeakifyMacro.h"

static const NSUInteger kKSUsersCount = 100;

static NSString * const kKSPListName  = @"users.plist";

@interface KSUsers ()
@property (nonatomic, assign, getter=isCashed) BOOL cashed;

- (void)fillWithUsers:(NSArray *)objects;
- (NSMutableArray *)usersWithCount:(NSUInteger)count;
- (NSString *)path;

@end

@implementation KSUsers

@dynamic cashed;

#pragma mark -
#pragma mark Public

- (void)save {
    provideDirectoryAtPath:[NSFileManager applicationDataPath];
    [NSKeyedArchiver archiveRootObject:self.objects toFile:[self path]];
    self.cashed = YES;
}

- (void)load {
    [super load];
}

#pragma mark -
#pragma mark Private

- (void)performBackgroundLoading {
    @synchronized(self) {
        NSArray *objects = [NSKeyedUnarchiver unarchiveObjectWithFile:[self path]];
        if (objects) {
            [self fillWithUsers:objects];
        } else {
            [self fillWithUsers:[self usersWithCount:kKSUsersCount]];
        }
        
        self.state = KSModelStateFinished;
    }
//    sleep(3);
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

- (NSMutableArray *)usersWithCount:(NSUInteger)count {
    NSMutableArray *array = [NSMutableArray array];
    for (NSUInteger index = 0; index < kKSUsersCount; index++) {
        [array addObject:[KSUser new]];
    }
    
    return array;
}

- (NSString *)path {
    return [[NSFileManager applicationDataPath] stringByAppendingPathComponent:kKSPListName];
}

@end
