//
//  KSCoreDataManager.m
//  KSProjectUI
//
//  Created by Serg Bla on 24.04.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSCoreDataManager.h"
#import <UIKit/UIKit.h>

#import "KSDispatch.h"

#import "UIAlertView+KSExtensions.h"
#import "NSManagedObjectContext+KSExtensions.h"


#import "KSWeakifyMacro.h"

static KSCoreDataManager *sharedCoreDataManager = nil;

static NSString * const kKSMomResource         = @"KSDataModel";
static NSString * const kKSMomExtension        = @"momd";
static NSString * const kKSMomErrorDescription = @"Error initializing Managed Object Model";
static NSString * const kKSDataBaseName        = @"facebookUsers.sqlite";

@interface KSCoreDataManager ()
@property (nonatomic, strong) NSMutableArray  *notificationObservers;


@end

@implementation KSCoreDataManager

#pragma mark - Singleton

+ (instancetype)sharedCoreDataManager {
    KSDispatchOnce(^{
        sharedCoreDataManager = [self new];
    });
    
    return sharedCoreDataManager;
}

#pragma mark - Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    
    [self initializeCoreData];
    
    return self;
}

#pragma mark - Public

- (void)initializeCoreData {
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:kKSMomResource withExtension:kKSMomExtension];
    
    NSManagedObjectModel *mom = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    
    if (!mom) {
        [UIAlertView presentWithError:[NSError errorWithDomain:NSCocoaErrorDomain
                                                          code:0
                                                      userInfo:@{NSLocalizedDescriptionKey : kKSMomErrorDescription}]];
    }
    
    NSPersistentStoreCoordinator *persistentStoreCoordinator =
    [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:mom];
    
    NSManagedObjectContext *managedObjectContext =
    [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    
    [managedObjectContext setPersistentStoreCoordinator:persistentStoreCoordinator];
    
    [self setManagedObjectContext:managedObjectContext];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSURL *documentsURL = [[fileManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    NSURL *storeURL = [documentsURL URLByAppendingPathComponent:kKSDataBaseName];
    
    NSError *error = nil;
    [persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType
                                             configuration:nil
                                                       URL:storeURL
                                                   options:nil
                                                     error:&error];
    if (error) {
        [UIAlertView presentWithError:error];
    }
}

#pragma mark - Private 

- (void)startObservingNotification {
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    NSArray *array = @[UIApplicationWillResignActiveNotification, UIApplicationWillTerminateNotification];
    NSMutableArray *observers = self.notificationObservers;
    
    KSWeakify(self);
    id block = ^(NSNotification *note){
        KSStrongifyAndReturnIfNil(self);
        [[self.managedObjectContext class] saveManagedObjectContext];
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
