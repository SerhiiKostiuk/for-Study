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

#pragma mark -
#pragma mark Accesors

- (NSArray *)items {
//    @synchronized(self.mutableItems) {
        return [[self.mutableItems copy] autorelease];
//    }
}


#pragma mark -
#pragma mark Public Methods

- (void)addItems:(id)item {
        @synchronized(self.mutableItems) {
            [self.mutableItems addObject:item];
        }
}

- (void)removeItems:(id)item {
    @synchronized(self.mutableItems) {
        [self.mutableItems removeObject:item];
    }
}


@end
