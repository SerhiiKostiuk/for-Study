//
//  KSObjectsCache.m
//  KSProjectUI
//
//  Created by Serg Bla on 12.03.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSObjectsCache.h"

@interface KSObjectsCache ()
@property (nonatomic, strong) NSMapTable *objects;

@end

@implementation KSObjectsCache

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    self.objects = [NSMapTable mapTableWithKeyOptions:NSPointerFunctionsStrongMemory | NSPointerFunctionsObjectPersonality
                                         valueOptions:NSPointerFunctionsWeakMemory];
    
    return self;
}

#pragma mark -
#pragma mark Public

- (id)objectForKey:(id)key {
    @synchronized(self) {
        return [self.objects objectForKey:key];
    }
}

- (void)setObject:(id)object forKey:(id)key {
    @synchronized(self) {
        [self.objects setObject:object forKey:key];
    }
}

- (id)objectForKeyedSubscript:(id)key {
    return [self objectForKey:key];
}

- (void)setObject:(id)object forKeyedSubscript:(id)key {
    [self setObject:object forKey:key];
}

@end
