//
//  KSUser.m
//  KSProjectUI
//
//  Created by Serg Bla on 24.04.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSUser.h"
#import "KSUsers.h"

#import "NSManagedObject+KSExtensions.h"

#import "KSMacro.h"

static NSString * const kKSUserIdkey = @"id";

@interface KSUser ()
@property (nonatomic, strong) KSUsers   *friends;

@end

@implementation KSUser

@synthesize friends = _friends;

@dynamic gender;
@dynamic lastName;
@dynamic firstName;
@dynamic dbFriends;

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithEntity:(NSEntityDescription *)entity
insertIntoManagedObjectContext:(NSManagedObjectContext *)context
{
    self = [super initWithEntity:entity insertIntoManagedObjectContext:context];
    self.friends = [[KSUsers alloc] initializeFetchedResultsControllerForEntity:entity
                                                       withManagedObjectContext:context];
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSString *)ID {
    return [self customValueForKey:kKSUserIdkey];
}

- (void)setID:(NSString *)ID {
    [self setCustomValue:ID forKey:kKSUserIdkey];
}

- (void)addFriend:(KSUser *)value {
    [self addCustomValue:value inMutableSetForKey:NSStringFromSelector(dbFriends)];
    [self.friends addObject:value];
}

- (void)removeFriend:(KSUser *)value {
    [self removeCustomValue:value inMutableSetForKey:NSStringFromSelector(dbFriends)];
}

@end
