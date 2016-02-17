//
//  KSUsers.m
//  KSProjectUI
//
//  Created by Serg Bla on 10.02.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSUsers.h"

#import "KSUser.h"

#import "KSWeakifyMacro.h"

static const NSUInteger kKSUsersArraySize = 2;

@interface KSUsers ()

- (void)fillWithUsers;

@end

@implementation KSUsers

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
#pragma mark Private

- (void)fillWithUsers {
    KSWeakify(self);
    [self performBlockWithoutNotification:^{
        KSStrongifyAndReturnIfNil(self);
        for (NSUInteger index = 0; index < kKSUsersArraySize; index++) {
            [self addObject:[KSUser new]];
        }
    }];
    
}

@end
