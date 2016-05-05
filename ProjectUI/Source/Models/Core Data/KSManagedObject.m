//
//  KSManagedObject.m
//  KSProjectUI
//
//  Created by Serg Bla on 21.04.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSManagedObject.h"

#import "KSObservableObject.h"
#import "KSCoreDataManager.h"
#import "UIAlertView+KSExtensions.h"

@interface KSManagedObject ()
@property (nonatomic, strong) KSObservableObject *observableObject;

@end

@implementation KSManagedObject
@synthesize observableObject = _obervableObject;
@dynamic ID;

#pragma mark - Class Methods 

+ (id)managedObjectWithID:(NSString *)ID AndEntityName:(NSString *)entityName  {
    KSManagedObject *object = nil;
    KSCoreDataManager *manager = [KSCoreDataManager sharedCoreDataManager];
    NSManagedObjectContext *context = manager.managedObjectContext;
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:entityName];
    
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"userId = %@",ID]];
    
    NSError *error = nil;
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    
    if (!fetchedObjects) {
        [UIAlertView presentWithError:error];
    }
    
    if (fetchedObjects.count == 0) {
        object = [NSEntityDescription insertNewObjectForEntityForName:entityName inManagedObjectContext:context];
        object.ID = ID;
        
        if (![context save:&error]) {
            [UIAlertView presentWithError:error];
        }
    } else {
        object = fetchedObjects.firstObject;
    }
    
    return object;
}

#pragma mark - Initializations and Deallocations

- (instancetype)initWithEntity:(NSEntityDescription *)entity
insertIntoManagedObjectContext:(NSManagedObjectContext *)context
{
    self = [super initWithEntity:entity insertIntoManagedObjectContext:context];
    self.observableObject = [[KSObservableObject alloc] initWithTarget:self];
    
    return self;
}

#pragma mark - Accessors

//- (NSString *)ID {
//    return [self customValueForKey:kKSUserIdkey];
//}
//
//- (void)setID:(NSString *)ID {
//    [self setCustomValue:ID forKey:kKSUserIdkey];
//}

#pragma mark - Private

- (id)forwardingTargetForSelector:(SEL)selector {
    id observableObject = self.observableObject;
    if ([observableObject respondsToSelector:selector]) {
        return observableObject;
    }
    
    return [super forwardingTargetForSelector:selector];
}

@end
