//
//  KSArrayModel.m
//  KSProjectUI
//
//  Created by Serg Bla on 12.02.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSArrayModel.h"

#import "KSArrayIndexChangeModel.h"
#import "KSArrayDoubleIndexChangeModel.h"
#import "KSCollectionChangeModel+KSArrayModel.h"
#import "KSCollectionObserver.h"

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

- (NSArray *)objects {
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

- (id)objectAtIndexedSubscript:(NSUInteger) index {
    return [self objectAtIndex:index];
}

- (void)addObject:(id)object {
    NSMutableArray *mutableObjects = self.mutableObjects;
    @synchronized(mutableObjects) {
        [mutableObjects addObject:object];
        
        [self notifyObserversWithChangeModel:[KSCollectionChangeModel addModelWithIndex:self.count - 1]];
    }
}
- (void)insertObjectAtIndex:(id)object index:(NSUInteger)index {
    NSMutableArray *mutableObjects = self.mutableObjects;
    @synchronized(mutableObjects) {
        [mutableObjects insertObject:object atIndex:index];

        [self notifyObserversWithChangeModel:[KSCollectionChangeModel insertModelWithIndex:index]];
    }
}

- (void)removeLastObject {
    NSMutableArray *mutableObjects = self.mutableObjects;
    @synchronized(mutableObjects) {
        [mutableObjects removeLastObject];
        
        [self notifyObserversWithChangeModel:[KSCollectionChangeModel removeModelWithIndex:self.count - 1]];
    }
}

- (void)removeObjectAtIndex:(NSUInteger)index {
    NSMutableArray *mutableObjects = self.mutableObjects;
    @synchronized(mutableObjects) {
        [mutableObjects removeObjectAtIndex:index];
        
        [self notifyObserversWithChangeModel:[KSCollectionChangeModel removeModelWithIndex:index]];
    }
}

- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(id)object {
    NSMutableArray *mutableObjects = self.mutableObjects;
    @synchronized(mutableObjects) {
        [mutableObjects replaceObjectAtIndex:index withObject:object];

        [self notifyObserversWithChangeModel:[KSCollectionChangeModel replaceModelWithIndex:index]];
    }
}

- (void)exchangeObjectAtIndex:(NSUInteger)firstIndex withObjectAtIndex:(NSUInteger)secondIndex {
    NSMutableArray *mutableObjects = self.mutableObjects;
    @synchronized(mutableObjects) {
        [mutableObjects exchangeObjectAtIndex:firstIndex withObjectAtIndex:secondIndex];

        [self notifyObserversWithChangeModel:[KSCollectionChangeModel exchangeModelWithIndex:firstIndex
                                                                                     toIndex:secondIndex]];
    }
}

- (void)moveObjectAtIndex:(NSUInteger)firstIndex toIndex:(NSUInteger)secondIndex {
    NSMutableArray *mutableObjects = self.mutableObjects;
    @synchronized(mutableObjects) {
        id object = [self objectAtIndex:firstIndex];
        [mutableObjects insertObject:object atIndex:firstIndex < secondIndex ? secondIndex + 1 : secondIndex];
        [mutableObjects removeObjectAtIndex:firstIndex > secondIndex ? firstIndex + 1 : firstIndex];
        
        [self notifyObserversWithChangeModel:[KSCollectionChangeModel moveModelWithIndex:firstIndex
                                                                                 toIndex:secondIndex]];
    }
}

#pragma mark -
#pragma mark Private

- (void)notifyObserversWithChangeModel:(KSCollectionChangeModel *)model {
    [self notifyObserversWithSelector:@selector(collection:didChangeWithModel:) withObject:model];
}

@end
