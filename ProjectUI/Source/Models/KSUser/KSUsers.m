//
//  KSUsers.m
//  KSProjectUI
//
//  Created by Serg Bla on 10.02.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSUsers.h"

#import "KSUser.h"
#import "NSFileManager+KSExtensions.h"
#import "KSWeakifyMacro.h"

static NSString * const kKSPListName  = @"users.plist";

@interface KSUsers ()
@property (nonatomic, strong) NSMutableArray        *notificationObservers;
@property (nonatomic, assign, getter=isCached) BOOL cached;

@property(nonatomic, copy) NSString  *path;

- (NSString *)usersFolderPath;
- (void)startObservingNotification;
- (void)endObservingNotification;
- (void)performBackgroundLoading;
- (void)fillWithUsers:(NSArray *)objects;

@end

@implementation KSUsers


@dynamic cached;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    [self endObservingNotification];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.notificationObservers = [NSMutableArray new];
        [self startObservingNotification];
    }
    return self;
}


#pragma mark -
#pragma mark Accessors

- (NSString *)path {
    return [self usersFolderPath];
}

- (BOOL)isCached {
    return [[NSFileManager defaultManager] fileExistsAtPath:self.path];
}

#pragma mark -
#pragma mark Public

- (void)save {
    [self.objects writeToFile:self.path atomically:YES];
}

#pragma mark -
#pragma mark Private

- (NSString *)usersFolderPath {
    NSString *usersFolderName = [[NSFileManager applicationDataPath] stringByAppendingPathComponent:kKSPListName];
    [[NSFileManager defaultManager] provideDirectoryAtPath:usersFolderName];
    
    return usersFolderName;
}

- (void)startObservingNotification {
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    NSArray *array = @[UIApplicationWillResignActiveNotification, UIApplicationWillTerminateNotification];
    NSMutableArray *observers = self.notificationObservers;
    
    KSWeakify(self);
    id block = ^(NSNotification *note){
        KSStrongifyAndReturnIfNil(self);
        [self save];
    };
    
    for (NSString *notification in array) {
        [observers addObject:[center addObserverForName:notification object:nil queue:nil usingBlock:block]];
    }
}

- (void)endObservingNotification {
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    NSArray *observers = [self.notificationObservers copy];
    
    for (id observer in observers) {
        [center removeObserver:observer name:nil object:nil];
        [self.notificationObservers removeObject:observer];
        
    }
}

- (void)performBackgroundLoading {
    sleep(2);
    
    NSArray *objects = nil;
    if (self.cached) {
        objects = [NSKeyedUnarchiver unarchiveObjectWithFile:self.path];
        [self fillWithUsers:objects];
        
        @synchronized(self) {
            self.state = KSModelStateFinishedLoading;
        }
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
