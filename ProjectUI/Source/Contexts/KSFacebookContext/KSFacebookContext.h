//
//  KSFacebookContext.h
//  KSProjectUI
//
//  Created by Serg Bla on 22.03.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSContext.h"

@class FBSDKGraphRequest;

@interface KSFacebookContext : KSContext
@property (nonatomic, readonly) NSString           *path;
@property (nonatomic, readonly) NSDictionary       *parameters;
@property (nonatomic, readonly) FBSDKGraphRequest  *graphRequest;

- (void)handleResponse:(NSURLResponse *)response withResult:(NSDictionary *)result;
- (void)load;

@end
