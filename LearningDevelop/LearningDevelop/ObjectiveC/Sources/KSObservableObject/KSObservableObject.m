//
//  KSObjservableObject.m
//  LearningDevelop
//
//  Created by Serg Bla on 20.12.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import "KSObservableObject.h"
#import "KSWeakReference.h"
#import "KSItemsContainer.h"
@interface KSObservableObject ()
@property (nonatomic,readwrite, retain) NSMutableSet *mutableObservers;

@end

@implementation KSObservableObject

@dynamic observers;


#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.mutableObservers = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.mutableObservers = [NSMutableSet set];
    }
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSSet *) observers {
    NSMutableSet *observers = self.mutableObservers;
    NSMutableSet *result = [NSMutableSet setWithCapacity:[observers count]];
    for (KSReference *reference in observers) {
        [result addObject:reference.target];
    }
    
    return [[result copy] autorelease];
}

#pragma mark -
#pragma mark Public

- (void) addObserver:(id)observer {
    @synchronized(self) {
        KSWeakReference *reference = [[[KSWeakReference alloc] initWithTarget:observer] autorelease];
        [self.mutableObservers addObject:reference];
    }
}

- (void)removeObserver:(id)observer {
    @synchronized(self) {
        NSSet *set = self.observers;
        for (KSWeakReference *reference in set) {
            if (reference.target == observer) {
                [self.mutableObservers removeObject:reference];
                break;
            }
        }
    }
}

- (void)notifyObserversWithSelector:(SEL)selector {
    [self notifyObserversWithSelector:selector withObject:nil];
}

- (void)notifyObserversWithSelector:(SEL)selector withObject:(id)object {
    [self notifyObserversWithSelector:selector withObject:object withObject:nil];
}

- (void)notifyObserversWithSelector:(SEL)selector withObject:(id)object withObject:(id)object2 {
    NSSet *observers = self.observers;
    for (id observer in observers) {
        if ([observer respondsToSelector:selector]) {
            [observer performSelector:(SEL)selector withObject:object withObject:object2];
        }
    }
}
@end
