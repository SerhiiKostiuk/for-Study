//
//  KSFacebookFriendsContext.h
//  KSProjectUI
//
//  Created by Serg Bla on 15.03.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSFacebookContext.h"

@class KSUser;

@interface KSFacebookFriendsContext : KSFacebookContext
@property (nonatomic, strong) KSUser  *user;


@end
