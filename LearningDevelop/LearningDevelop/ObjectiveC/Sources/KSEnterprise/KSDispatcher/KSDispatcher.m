//
//  KSDispatcher.m
//  LearningDevelop
//
//  Created by Serg Bla on 19.01.16.
//  Copyright © 2016 Serg Bla. All rights reserved.
//

#import "KSDispatcher.h"
#import "KSQueue.h"
#import "NSObject+KSExtensions.h"
#import "KSEmployee.h"

@interface KSDispatcher ()
@property (nonatomic, retain) NSMutableArray *mutableHandlers;
@property (nonatomic, retain) KSQueue        *objectsQueue;

- (id)freeHandler;
- (void)performWork;

@end

@implementation KSDispatcher

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.mutableHandlers = nil;
    self.objectsQueue = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.mutableHandlers = [NSMutableArray array];
        self.objectsQueue = [KSQueue object];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)handlers {
    @synchronized(self.mutableHandlers) {
        return [[self.mutableHandlers copy] autorelease];
    }
}

#pragma mark -
#pragma mark Public

- (void)performWorkWithObject:(id)object {
    [self.objectsQueue enqueue:object];
    [self performWork];
}

- (void)addHandler:(id)handler {
    @synchronized(self.mutableHandlers) {
        [self.mutableHandlers addObject:handler];
    }
}

- (void)removeHandler:(id)handler {
    @synchronized(self.mutableHandlers) {
        [self.mutableHandlers removeObject:handler];
    }
}

#pragma mark -
#pragma mark Private

- (id)freeHandler {
    for (KSEmployee *handler in self.handlers) {
        @synchronized(handler) {
            if (kKSEmployeeDidBecomeFree == handler.state) {
                
                return handler;
            }
        }
    }
    
    return nil;
}

- (void)performWork {
    id object = [self.objectsQueue dequeue];
    if (object) {
        id employee = [self freeHandler];
        if (employee) {
            [employee performWorkWithObject:object];
        } else {
            [self.objectsQueue enqueue:object];
        }
    }
}

- (id)containHandler:(id)object {
    @synchronized(object) {
        [self.mutableHandlers containsObject:object];
    }
    return object;
}

#pragma mark -
#pragma mark KSEmployeeProtocol

- (void)employeeDidBecomeFree:(id)employee {
    [self performWork];
}

@end
