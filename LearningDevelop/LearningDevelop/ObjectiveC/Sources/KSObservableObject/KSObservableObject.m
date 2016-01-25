//
//  KSObjservableObject.m
//  LearningDevelop
//
//  Created by Serg Bla on 20.12.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import "KSObservableObject.h"
#import "KSWeakReference.h"

@interface KSObservableObject ()
@property (nonatomic, retain) NSMutableSet *mutableObservers;

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

- (NSSet *)observers {
    NSMutableSet *observers = self.mutableObservers;
    @synchronized(observers) {
        NSMutableSet *result = [NSMutableSet setWithCapacity:observers.count];
        for (KSReference *reference in observers) {
            [result addObject:reference.target];
        }
        
        return [[result copy] autorelease];
    }
}

- (void)setState:(NSUInteger)state {
    [self setState:state withObject:nil];
}

- (void)setState:(NSUInteger)state withObject:(id)object {
    if (_state != state) {
        _state = state;
        
        [self notifyObserversWithSelector:[self selectorForState:state] withObject:self];
    }
}

#pragma mark -
#pragma mark Public

- (void)addObserver:(id)observer {
    @synchronized(self) {
        KSWeakReference *reference = [[[KSWeakReference alloc] initWithTarget:observer] autorelease];
        [self.mutableObservers addObject:reference];
    }
}

- (void)addObserversFromArray:(NSArray *)observers {
    @synchronized(self) {
        for (id observer in observers) {
            [self addObserver:observer];
        }
    }
}

- (void)removeObserver:(id)observer {
    @synchronized(self) {
        KSWeakReference *reference = [[[KSWeakReference alloc] initWithTarget:observer] autorelease];
        [self.mutableObservers removeObject:reference];        
    }
}

- (void)removeObserversFromArray:(NSArray *)observers {
    @synchronized(self) {
        for (id observer in observers) {
            [self removeObserver:observer];
        }
    }
}

- (void)notifyObserversWithSelector:(SEL)selector {
    [self notifyObserversWithSelector:selector withObject:nil];
}

- (void)notifyObserversWithSelector:(SEL)selector withObject:(id)object {
    @synchronized(self) {
        NSSet *observers = self.observers;
        for (id observer in observers) {
            if ([observer respondsToSelector:selector]) {
                [observer performSelector:selector withObject:self withObject:object];
            }
        }
    }    
}

- (SEL)selectorForState:(NSUInteger)state {
    return NULL;
}

@end
