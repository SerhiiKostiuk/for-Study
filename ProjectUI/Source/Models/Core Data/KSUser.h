//
//  KSUser.h
//  KSProjectUI
//
//  Created by Serg Bla on 24.04.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class KSUsers;

@interface KSUser : NSManagedObject
@property (nonatomic, strong) NSString *gender;
@property (nonatomic, strong) NSString *ID;
@property (nonatomic, strong) NSString *lastName;
@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSSet    *dbFriends;

@property (nonatomic, readonly) KSUsers *friends;

- (void)addFriend:(KSUser *)value;
- (void)removeFriend:(KSUser *)value;

@end
