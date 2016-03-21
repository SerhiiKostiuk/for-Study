//
//  KSContext.h
//  KSProjectUI
//
//  Created by Serg Bla on 15.03.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@class KSModel;
@class FBSDKGraphRequest;

@interface KSContext : NSObject

@property (nonatomic, strong) KSModel *model;

- (void)execute;
- (void)cancel;

- (FBSDKGraphRequest *)graphRequest:(NSString *)grathPath;

@end
