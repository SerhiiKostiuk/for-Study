//
//  KSManagedObject.h
//  KSProjectUI
//
//  Created by Serg Bla on 21.04.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import <CoreData/CoreData.h>

#import "KSObservableObjectMixin.h"

@interface KSManagedObject : NSManagedObject <KSObservableObjectMixin>
@property (nonatomic, strong) NSString *ID;

+ (id)managedObjectWithID:(NSString *)ID AndEntityName:(NSString *)entityName;

@end
