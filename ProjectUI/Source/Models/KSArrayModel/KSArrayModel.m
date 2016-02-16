//
//  KSArrayModel.m
//  KSProjectUI
//
//  Created by Serg Bla on 12.02.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSArrayModel.h"

@interface KSArrayModel ()
@property (nonatomic, strong) NSMutableArray *mutableObjects;

@end

@implementation KSArrayModel

@dynamic objects;
@dynamic count;

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    if (self) {
        self.mutableObjects = [NSMutableArray new];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)users {
    NSMutableArray *mutableObjects = self.mutableObjects;
    @synchronized(mutableObjects) {
        return [mutableObjects copy];
    }
}

- (NSUInteger)count {
    NSMutableArray *mutableObjects = self.mutableObjects;
    @synchronized(mutableObjects) {
        return mutableObjects.count;
    }
}

#pragma mark -
#pragma mark Public

- (id)objectAtIndex:(NSUInteger)index {
    NSMutableArray *mutableObjects = self.mutableObjects;
    @synchronized(mutableObjects) {
        return [mutableObjects objectAtIndex:index];
    }
}

- (void)addObject:(id)object {
    NSMutableArray *mutableObjects = self.mutableObjects;
    @synchronized(mutableObjects) {
        [mutableObjects addObject:object];
    }
}
- (void)insertObjectAtIndex:(id)object index:(NSUInteger)index {
    NSMutableArray *mutableObjects = self.mutableObjects;
    @synchronized(mutableObjects) {
        [mutableObjects insertObject:object atIndex:index];
    }
}

- (void)removeLastObject {
    NSMutableArray *mutableObjects = self.mutableObjects;
    @synchronized(mutableObjects) {
        [mutableObjects removeLastObject];
    }
}

- (void)removeObjectAtIndex:(NSUInteger)index {
    NSMutableArray *mutableObjects = self.mutableObjects;
    @synchronized(mutableObjects) {
        [mutableObjects removeObjectAtIndex:index];
    }
}

- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(id)object {
    NSMutableArray *mutableObjects = self.mutableObjects;
    @synchronized(mutableObjects) {
        [mutableObjects replaceObjectAtIndex:index withObject:object];
    }
}

- (void)exchangeObjectAtIndex:(NSUInteger)firstIndex withObjectAtIndex:(NSUInteger)secondIndex {
    NSMutableArray *mutableObjects = self.mutableObjects;
    @synchronized(mutableObjects) {
        [mutableObjects exchangeObjectAtIndex:firstIndex withObjectAtIndex:secondIndex];
    }
}

- (void)moveObjectAtIndex:(NSUInteger)firstIndex toIndex:(NSUInteger)secondIndex {
    NSMutableArray *mutableObjects = self.mutableObjects;
    @synchronized(mutableObjects) {
        id object = [self objectAtIndex:firstIndex];
        [mutableObjects removeObjectAtIndex:firstIndex];
        [mutableObjects insertObject:object atIndex:secondIndex];
    }
}
@end
