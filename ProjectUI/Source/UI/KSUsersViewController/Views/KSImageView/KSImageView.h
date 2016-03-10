//
//  KSImageView.h
//  KSProjectUI
//
//  Created by Serg Bla on 04.03.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "KSView.h"

@class KSImageModel;

@interface KSImageView : KSView
@property (nonatomic, strong) KSImageModel  *imageModel;

@end
