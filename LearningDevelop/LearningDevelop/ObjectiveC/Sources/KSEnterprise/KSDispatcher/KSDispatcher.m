//
//  KSDispatcher.m
//  LearningDevelop
//
//  Created by Serg Bla on 19.01.16.
//  Copyright © 2016 Serg Bla. All rights reserved.
//

#import "KSQueue.h"
#import "KSEmployee.h"
#import "KSDispatcher.h"

@interface KSDispatcher ()
@property (nonatomic, retain) NSMutableArray *mutableHandlers;
@property (nonatomic, retain) KSQueue        *objectsQueue;

- (id)reserveHandler;
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
    NSMutableArray *mutableHandlers = self.mutableHandlers;
    @synchronized(mutableHandlers) {
        return [[mutableHandlers copy] autorelease];
    }
}

#pragma mark -
#pragma mark Public

- (void)performWorkWithObject:(id)object {
    [self.objectsQueue enqueue:object];
    [self performWork];
}

- (void)addHandler:(id)handler {
    NSMutableArray *mutableHandlers = self.mutableHandlers;
    @synchronized(mutableHandlers) {
        [mutableHandlers addObject:handler];
    }
}

- (void)removeHandler:(id)handler {
    NSMutableArray *mutableHandlers = self.mutableHandlers;
    @synchronized(mutableHandlers) {
        [mutableHandlers removeObject:handler];
    }
}

#pragma mark -
#pragma mark Private

- (id)reserveHandler {
    for (KSEmployee *handler in self.handlers) {
        @synchronized(handler) {
            if (kKSEmployeeDidBecomeFree == handler.state) {
                handler.state = kKSEmployeeDidStartWork;
                return handler;
            }
        }
    }
    
    return nil;
}

- (void)performWork {
    id object = [self.objectsQueue dequeue];
    if (object) {
        id employee = [self reserveHandler];
        if (employee) {
            [employee performWorkWithObject:object];
        } else {
            [self.objectsQueue enqueue:object];
        }
    }
}

- (BOOL)containsHandler:(id)object {
    NSMutableArray *mutableHandlers = self.mutableHandlers;
    @synchronized(mutableHandlers) {
        return [mutableHandlers containsObject:object];
    }
}

#pragma mark -
#pragma mark KSEmployeeProtocol

- (void)employeeDidBecomeFree:(id)employee {
    [self performWork];
}

@end
