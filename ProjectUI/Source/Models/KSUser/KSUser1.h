//
//  KSUser.h
//  KSProjectUI
//
//  Created by Serg Bla on 09.02.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSObservableObject.h"
#import <UIKit/UIKit.h>

#import "KSModel.h"

@class KSImageModel;
@class KSUsers;

@interface KSUser1 : KSModel <NSCoding>
@property (nonatomic, copy)     NSString     *ID;
@property (nonatomic, copy)     NSString     *firstName;
@property (nonatomic, copy)     NSString     *lastName;
@property (nonatomic, copy)     NSString     *gender;

@property (nonatomic, readonly) KSImageModel *previewImageModel;
@property (nonatomic, copy)     NSURL        *previewImageURL;

@property (nonatomic, readonly) KSImageModel *largeImageModel;
@property (nonatomic, copy)     NSURL        *largeImageURL;

@property (nonatomic, strong)   KSUsers      *friends;

@end
