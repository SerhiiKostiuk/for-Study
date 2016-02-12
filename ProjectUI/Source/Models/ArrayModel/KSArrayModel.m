//
//  KSArrayModel.m
//  KSProjectUI
//
//  Created by Serg Bla on 12.02.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSArrayModel.h"

@interface KSArrayModel ()
@property (nonatomic, strong) NSMutableArray *mutableArray;

@end

@implementation KSArrayModel

#pragma mark -
#pragma mark Public

- (id)objectAtIndex:(NSUInteger)index {
    NSMutableArray *mutableArray = self.mutableArray;
    @synchronized(mutableArray) {
        return [mutableArray objectAtIndex:index];
    }
}

- (void)addObject:(id)object {
    NSMutableArray *mutableArray = self.mutableArray;
    @synchronized(mutableArray) {
        [mutableArray addObject:object];
    }
}
- (void)insertObjectAtIndex:(id)object index:(NSUInteger)index {
    NSMutableArray *mutableArray = self.mutableArray;
    @synchronized(mutableArray) {
        [mutableArray insertObject:object atIndex:index];
    }
}

- (void)removeLastObject {
    NSMutableArray *mutableArray = self.mutableArray;
    @synchronized(mutableArray) {
        [mutableArray removeLastObject];
    }
}

- (void)removeObjectAtIndex:(NSUInteger)index {
    NSMutableArray *mutableArray = self.mutableArray;
    @synchronized(mutableArray) {
        [mutableArray removeObjectAtIndex:index];
    }
}

- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(id)object {
    NSMutableArray *mutableArray = self.mutableArray;
    @synchronized(mutableArray) {
        [mutableArray replaceObjectAtIndex:index withObject:object];
    }
}

- (void)exchangeObjectAtIndex:(NSUInteger)firstIndex withObjectAtIndex:(NSUInteger)secondIndex {
    NSMutableArray *mutableArray = self.mutableArray;
    @synchronized(mutableArray) {
        [mutableArray exchangeObjectAtIndex:firstIndex withObjectAtIndex:secondIndex];
    }
}

@end
