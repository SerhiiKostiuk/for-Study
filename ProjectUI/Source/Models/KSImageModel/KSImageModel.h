//
//  KSImageModel.h
//  KSProjectUI
//
//  Created by Serg Bla on 03.03.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSModel.h"

#import <UIKit/UIKit.h>

@interface KSImageModel : KSModel
@property (nonatomic, readonly) UIImage  *image;
@property (nonatomic, readonly) NSURL    *url;

@property (nonatomic, readonly, getter=isLoaded) BOOL loaded;

+ (instancetype)imageWithUrl:(NSURL *)url;

- (instancetype)initWithUrl:(NSURL *)url;

- (void)load;
- (void)cancel;

@end 
