//
//  containerForItems.m
//  LearningDevelop
//
//  Created by Serg Bla on 13.12.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import "containerForItems.h"

@interface containerForItems ()

@property (nonatomic, retain) NSMutableArray *mutableItems;

@end

@implementation containerForItems

@dynamic items;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.mutableItems = nil;
    
    [super dealloc];
}

- (instancetype)init {
    [self initWithCapacity:0];
    
    return self;
}

- (instancetype)initWithCapacity:(NSUInteger)capacity {
    self = [super init];
    self.mutableItems = [[[NSMutableArray alloc]initWithCapacity:capacity] autorelease];
    self.capacity = capacity;
    
    return self;
}

#pragma mark -
#pragma mark Accesors

- (NSArray *)items {
    return [[ _mutableItems copy] autorelease];
}

- (BOOL)isFull {
    return (self.mutableItems.count == self.capacity);
}

#pragma mark -
#pragma mark Public Methods

- (void)addItems:(id)item {
    BOOL result = ![self isFull];
    if (result) {
        [self.mutableItems addObject:item];
    }
}

- (void)removeItems:(id)item {
    [self.mutableItems removeObject:item];
}


@end
