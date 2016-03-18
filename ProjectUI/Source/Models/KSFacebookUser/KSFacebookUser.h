//
//  KSFacebookUser.h
//  KSProjectUI
//
//  Created by Serg Bla on 18.03.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSModel.h"

@class KSImageModel;
@class KSFacebookUsers;

@interface KSFacebookUser : KSModel <NSCoding>
@property (nonatomic, copy)     NSString         *firstName;
@property (nonatomic, copy)     NSString         *lastName;
@property (nonatomic, readonly) KSImageModel     *imageModel;
@property (nonatomic, strong)   KSFacebookUsers  *userFriends;
@property (nonatomic, copy)     NSURL            *imageURL;

@end
