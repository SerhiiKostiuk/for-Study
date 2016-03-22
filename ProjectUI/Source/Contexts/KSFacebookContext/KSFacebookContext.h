//
//  KSFacebookContext.h
//  KSProjectUI
//
//  Created by Serg Bla on 22.03.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSContext.h"

@interface KSFacebookContext : KSContext

- (FBSDKGraphRequest *)graphRequestWithPath;
- (NSString *)path;
- (void)handleResponse:(NSURLResponse *)response withResult:(NSDictionary *)result;
- (void)performBackgroundLoading;

@end
