//
//  KSUsers.m
//  KSProjectUI
//
//  Created by Serg Bla on 10.02.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSUsers.h"

#import "KSUser.h"

#import "NSPathUtilities+KSExtensions.h"

#import "KSWeakifyMacro.h"

static const NSUInteger kKSUsersArraySize = 2;

static NSString * const kKSObjectsKey = @"objects";
static NSString * const kKSPListName  = @"users";
static NSString * const kKSPlistType  = @"plist";

@interface KSUsers ()

- (NSString *)path;
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
#pragma mark Public

- (void)saveUsers {
    [NSKeyedArchiver archiveRootObject:self.objects toFile:[self path]];
}

- (id)loadUsers {
    return [NSKeyedUnarchiver unarchiveObjectWithFile:[self path]];
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

- (NSString *)path {
    NSString *path = NSSearchPathForDirectiry(NSDocumentDirectory);
    
    return path;
}

#pragma mark -
#pragma mark NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.objects forKey:kKSObjectsKey];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    [aDecoder decodeObjectForKey:kKSObjectsKey];
    
    return self;
}

@end
