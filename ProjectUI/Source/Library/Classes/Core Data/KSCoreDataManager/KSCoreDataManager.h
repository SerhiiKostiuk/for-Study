//
//  KSCoreDataManager.h
//  KSProjectUI
//
//  Created by Serg Bla on 24.04.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface KSCoreDataManager : NSObject
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

+ (instancetype)sharedCoreDataManager;

- (void)initializeCoreData;

@end
