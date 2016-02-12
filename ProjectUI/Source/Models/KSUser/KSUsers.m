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
    NSMutableArray *mutableUsers = self.mutableUsers;
    @synchronized(mutableUsers) {
        return mutableUsers.count;
    }
}

#pragma mark -
#pragma mark Private

- (void)fillWithUsers {
    NSUInteger arraySize = kKSUsersArraySize;
    NSMutableArray *mutableUsers = [NSMutableArray arrayWithCapacity:arraySize];
    @synchronized(mutableUsers) {
        for (NSUInteger index = 0; index < arraySize; index++) {
            [mutableUsers addObject:[KSUser new]];
        }
    }
    
    self.mutableUsers = mutableUsers;
}

@end
