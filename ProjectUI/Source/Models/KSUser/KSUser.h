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

@interface KSUser : KSModel <NSCoding>
@property (nonatomic, copy)     NSString  *name;
@property (nonatomic, readonly) KSImageModel *imageModel;

@end
