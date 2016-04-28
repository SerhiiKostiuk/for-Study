//
//  NSManagedObjectContext+KSExtensions.h
//  KSProjectUI
//
//  Created by Serg Bla on 26.04.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface NSManagedObjectContext (KSExtensions)

+ (void)saveManagedObjectContext;
+ (void)deleteManagedObject:(NSManagedObject *)object;

@end
