//
//  KSDBUser.m
//  KSProjectUI
//
//  Created by Serg Bla on 24.04.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSDBUser.h"
#import "KSUsers.h"

#import "NSManagedObject+KSExtensions.h"

#import "KSMacro.h"

@interface KSDBUser ()
@property (nonatomic, strong) KSUsers   *friends;

@end

@implementation KSDBUser

@synthesize friends = _friends;

@dynamic gender;
@dynamic userId;
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
#pragma mark Public

- (void)addFriend:(KSDBUser *)value {
    [self addCustomValue:value inMutableSetForKey:NSStringFromSelector(dbFriends)];
    [self.friends addObject:value];
}

- (void)removeFriend:(KSDBUser *)value {
    [self removeCustomValue:value inMutableSetForKey:NSStringFromSelector(dbFriends)];
}

@end
