//
//  KSDBUser.h
//  KSProjectUI
//
//  Created by Serg Bla on 24.04.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class KSUsers;

@interface KSDBUser : NSManagedObject
@property (nonatomic, strong) NSString *gender;
@property (nonatomic, strong) NSString *userId;
@property (nonatomic, strong) NSString *lastName;
@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSSet    *dbFriends;

@property (nonatomic, readonly) KSUsers *friends;

- (void)addFriend:(KSDBUser *)value;
- (void)removeFriend:(KSDBUser *)value;

@end
