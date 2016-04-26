//
//  KSCoreDataController.m
//  KSProjectUI
//
//  Created by Serg Bla on 24.04.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSCoreDataController.h"

#import "UIAlertView+KSExtensions.h"
#import "KSDispatch.h"

static NSString * const kKSMomResorce   = @"KSProjectUI";
static NSString * const kKSMomExtension = @"momd";
static NSString * const kKSMomErrorDescription = @"Error initializing Managed Object Model";
static NSString * const kKSDataBaseName = @"facebookUsers.sqlite";

@implementation KSCoreDataController

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    
    [self initializeCoreData];
    
    return self;
}

#pragma mark -
#pragma mark Public

- (void)initializeCoreData {
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:kKSMomResorce withExtension:kKSMomExtension];
    
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
    
    KSDispatchAsyncOnBackgroundQueue(^{
        NSError *error = nil;
        
        [persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType
                                                 configuration:nil
                                                           URL:storeURL
                                                       options:nil
                                                         error:&error];
        
        if (error) {
            [UIAlertView presentWithError:error];
        }
    });
}

- (void)saveManagedObjectContext {
    NSError *error = nil;
    [self.managedObjectContext save:&error];
    
    if (error) {
        [UIAlertView presentWithError:error];
    }
}

@end
