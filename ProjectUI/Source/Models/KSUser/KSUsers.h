//
//  KSUsers.h
//  KSProjectUI
//
//  Created by Serg Bla on 10.02.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSArrayModel.h"
#import <CoreData/NSFetchedResultsController.h>

#import "KSModelObserver.h"

@interface KSUsers : KSArrayModel <NSFetchedResultsControllerDelegate>
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
// delete other properties later 
@property(nonatomic, readonly) NSString  *usersPath;

- (instancetype)initializeFetchedResultsControllerForEntity:(NSEntityDescription *)entity
                                   withManagedObjectContext:(NSManagedObjectContext *)context;

- (void)save;

@end
