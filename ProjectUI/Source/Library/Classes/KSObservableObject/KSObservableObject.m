//
//  KSObjservableObject.m
//  LearningDevelop
//
//  Created by Serg Bla on 20.12.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import "KSObservableObject.h"
#import "KSWeakReference.h"

#import "KSWeakifyMacro.h"

@interface KSObservableObject ()
@property (nonatomic, retain) NSMutableSet *mutableObservers;

@property (nonatomic, assign, getter=isNotificationEnabled) BOOL notificationEnabled;

- (void)notify:(BOOL)isNotified whileBlockPerforming:(void(^)(void))block;

@end

@implementation KSObservableObject

@dynamic observers;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.mutableObservers = nil;
    
}

- (instancetype)init {
    return [self initWithTarget:nil];
}

- (instancetype)initWithTarget:(id)target {
    self = [super init];
    
    self.mutableObservers = [NSMutableSet set];
    self.notificationEnabled = YES;
    
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
        
        return [result copy];
    }
}

- (id)target {
    return _target ? _target : self;
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

- (void)addObserverObject:(id)observer {
    @synchronized(self) {
        [self.mutableObservers addObject:[[KSWeakReference alloc] initWithTarget:observer]];
    }
}

- (void)addObserversFromArray:(NSArray *)observers {
    @synchronized(self) {
        for (id observer in observers) {
            [self addObserverObject:observer];
        }
    }
}

- (void)removeObserver:(id)observer {
    @synchronized(self) {
        [self.mutableObservers removeObject:[[KSWeakReference alloc] initWithTarget:observer]];
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
        if (!self.notificationEnabled) {
            return;
        }
        
        NSSet *observers = self.observers;
        for (id observer in observers) {
            if ([observer respondsToSelector:selector]) {
                KSClangDiagnosticPushOption("clang diagnostic ignored \"-Warc-performSelector-leaks\"")
                [observer performSelector:selector withObject:self.target withObject:object];
                KSClangDiagnosticPopOption
            }
        }
    }    
}

- (SEL)selectorForState:(NSUInteger)state {
    return NULL;
}

- (void)performBlockWithNotification:(void(^)(void))block {
    [self notify:YES whileBlockPerforming:block];
}

- (void)performBlockWithoutNotification:(void(^)(void))block {
    [self notify:NO whileBlockPerforming:block];
}

#pragma mark -
#pragma mark Private

- (void)notify:(BOOL)isNotified whileBlockPerforming:(void(^)(void))block {
    @synchronized(self) {
        BOOL notificationEnabled = self.notificationEnabled;
        self.notificationEnabled = isNotified;
        if (block) {
            block();
        }
        
        self.notificationEnabled = notificationEnabled;
    }
}

@end
