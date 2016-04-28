//
//  NSManagedObjectContext+KSExtensions.m
//  KSProjectUI
//
//  Created by Serg Bla on 26.04.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "NSManagedObjectContext+KSExtensions.h"
#import "KSCoreDataManager.h"

#import "UIAlertView+KSExtensions.h"

@interface NSManagedObjectContext (KSExtensionsPrivate)

+ (NSManagedObjectContext *)context;

@end

@implementation NSManagedObjectContext (KSExtensionsPrivate)

+ (NSManagedObjectContext *)context {
    return [[KSCoreDataManager sharedCoreDataManager] managedObjectContext];
}

@end

@implementation NSManagedObjectContext (KSExtensions)

+ (void)saveManagedObjectContext {
    NSError *error = nil;
    [[self context] save:&error];
    
    if (error) {
        [UIAlertView presentWithError:error];
    }
}

+ (void)deleteManagedObject:(NSManagedObject *)object {
    [[self context] deleteObject:object];
    [self saveManagedObjectContext];
}

@end
