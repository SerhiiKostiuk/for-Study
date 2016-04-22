//
//  NSManagedObject+KSExtensions.h
//  KSProjectUI
//
//  Created by Serg Bla on 21.04.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface NSManagedObject (KSExtensions)

- (void)addCustomValue:(id)value inMutableSetForKey:(NSString *)key;

- (void)removeCustomValue:(id)value inMutableSetForKey:(NSString *)key;

@end
