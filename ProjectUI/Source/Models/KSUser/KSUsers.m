//
//  KSUsers.m
//  KSProjectUI
//
//  Created by Serg Bla on 10.02.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSUsers.h"

#import "KSUser.h"

static const NSUInteger kKSUsersArraySize = 2;

@interface KSUsers ()
@property (nonatomic, strong) NSMutableArray *mutableUsers;

- (void)fillWithUsers;

@end

@implementation KSUsers

@dynamic users;
@dynamic count;

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    if (self) {
        [self fillWithUsers];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)users {
    NSMutableArray *mutableUsers = self.mutableUsers;
    @synchronized(mutableUsers) {
        return [mutableUsers copy];
    }
}

- (NSUInteger)count {
    return self.mutableUsers.count;
}

#pragma mark -
#pragma mark Public

- (KSUser *)objectAtIndex:(NSUInteger)index {
    return [self.mutableUsers objectAtIndex:index];
}

- (void)addObject:(KSUser *)object {
    NSMutableArray *mutableUsers = self.mutableUsers;
    @synchronized(mutableUsers) {
        [mutableUsers addObject:object];
    }
}
- (void)insertObjectAtIndex:(KSUser *)object index:(NSUInteger)index {
    NSMutableArray *mutableUsers = self.mutableUsers;
    @synchronized(mutableUsers) {
        [mutableUsers insertObject:object atIndex:index];
    }
}

- (void)removeLastObject {
    NSMutableArray *mutableUsers = self.mutableUsers;
    @synchronized(mutableUsers) {
        [mutableUsers removeLastObject];
    }
}

- (void)removeObjectAtIndex:(NSUInteger)index {
    NSMutableArray *mutableUsers = self.mutableUsers;
    @synchronized(mutableUsers) {
        [mutableUsers removeObjectAtIndex:index];
    }
}

- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(KSUser *)object {
    NSMutableArray *mutableUsers = self.mutableUsers;
    @synchronized(mutableUsers) {
        [mutableUsers replaceObjectAtIndex:index withObject:object];
    }
}

- (void)exchangeObjectAtIndex:(NSUInteger)firstIndex withObjectAtIndex:(NSUInteger)secondIndex {
    NSMutableArray *mutableUsers = self.mutableUsers;
    @synchronized(mutableUsers) {
        [mutableUsers exchangeObjectAtIndex:firstIndex withObjectAtIndex:secondIndex];
    }
}

#pragma mark -
#pragma mark Private

- (void)fillWithUsers {
    NSMutableArray *mutableUsers = [NSMutableArray arrayWithCapacity:kKSUsersArraySize];
    @synchronized(mutableUsers) {
        for (NSUInteger index = 0; index < kKSUsersArraySize; index++) {
            [mutableUsers addObject:[KSUser new]];
        }
    }
    
    self.mutableUsers = mutableUsers;
}

@end
