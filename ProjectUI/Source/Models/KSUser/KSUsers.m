//
//  KSUsers.m
//  KSProjectUI
//
//  Created by Serg Bla on 10.02.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSUsers.h"

#import "KSUser.h"
#import "KSWeakifyMacro.h"

@interface KSUsers ()
@property (nonatomic, strong) NSMutableArray        *notificationObservers;

- (void)startObservingNotification;
- (void)endObservingNotification;

@end

@implementation KSUsers

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
#pragma mark Public

- (void)save {
    [self.objects writeToFile:self.path atomically:YES];
}

#pragma mark -
#pragma mark Private

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

@end
