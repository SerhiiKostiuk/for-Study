//
//  KSUser.h
//  KSProjectUI
//
//  Created by Serg Bla on 09.02.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSObservableObject.h"
#import <UIKit/UIKit.h>

@interface KSUser : KSObservableObject
@property (nonatomic, copy)   NSString  *name;
@property (nonatomic, strong) UIImage   *image;

@end
