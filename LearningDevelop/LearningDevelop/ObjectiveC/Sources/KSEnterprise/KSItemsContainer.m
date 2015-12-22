//
//  containerForItems.m
//  LearningDevelop
//
//  Created by Serg Bla on 13.12.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import "KSItemsContainer.h"

@interface KSItemsContainer ()

@property (nonatomic, readwrite, retain)  NSMutableArray   *mutableItems;
@property (nonatomic, readwrite ,assign)  NSUInteger       capacity;


@end

@implementation KSItemsContainer

@dynamic items;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.mutableItems = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.mutableItems = [NSMutableArray array];
    }
    return self;
}

- (instancetype)initWithCapacity:(NSUInteger)capacity {
    self = [super init];
    
    if (self) {
        self.capacity = capacity;

    }
    
    return self;
}

#pragma mark -
#pragma mark Accesors

- (NSArray *)items {
    return [[self.mutableItems copy] autorelease];
}

- (NSArray *)itemsOfClass:(Class)itemClass {
    NSMutableArray *mutableResult = [NSMutableArray array];
    for (id item in self.mutableItems) {
        if ([item isMemberOfClass:itemClass]) {
            [mutableResult addObject:item];
        }
    }
    
    return [[mutableResult copy] autorelease];
}

- (BOOL)isFull {
    return [self.mutableItems count] == self.capacity;
}

#pragma mark -
#pragma mark Public Methods

- (void)addItems:(id)item {
    if (![self isFull]) {
        [self.mutableItems addObject:item];
    }
}

- (void)removeItems:(id)item {
    [self.mutableItems removeObject:item];
}


@end
