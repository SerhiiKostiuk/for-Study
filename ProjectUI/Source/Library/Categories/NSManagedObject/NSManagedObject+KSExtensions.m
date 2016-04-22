//
//  NSManagedObject+KSExtensions.m
//  KSProjectUI
//
//  Created by Serg Bla on 21.04.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "NSManagedObject+KSExtensions.h"

#import "KSWeakifyMacro.h"

@implementation NSManagedObject (KSExtensions)

- (void)addCustomValue:(id)value inMutableSetForKey:(NSString *)key {
    [self manageCustomValue:value
         inMutableSetForKey:key
            withSetMutation:NSKeyValueUnionSetMutation
               withSelector:@selector(unionSet:)];
}

- (void)removeCustomValue:(id)value inMutableSetForKey:(NSString *)key {
    [self manageCustomValue:value
         inMutableSetForKey:key
            withSetMutation:NSKeyValueMinusSetMutation
               withSelector:@selector(minusSet:)];
}


- (void)manageCustomValue:(id)value
       inMutableSetForKey:(NSString *)key
          withSetMutation:(NSKeyValueSetMutationKind)mutation
             withSelector:(SEL)selector
{
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    
    [self willChangeValueForKey:key
                withSetMutation:mutation
                   usingObjects:changedObjects];
    
    NSMutableSet *primitiveSet = [self primitiveValueForKey:key];
    
    KSClangDiagnosticPushOption("clang diagnostic ignored \"-Warc-performSelector-leaks\"")
    [primitiveSet performSelector:selector withObject:changedObjects];
    KSClangDiagnosticPopOption
    
    [self didChangeValueForKey:key
               withSetMutation:NSKeyValueMinusSetMutation
                  usingObjects:changedObjects];
    
}

@end
