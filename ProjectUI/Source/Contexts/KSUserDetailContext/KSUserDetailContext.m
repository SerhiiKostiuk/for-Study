//
//  KSUserDetailContext.m
//  KSProjectUI
//
//  Created by Serg Bla on 04.04.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSUserDetailContext.h"
#import "KSFacebookConstants.h"

#import "KSUser.h"

@implementation KSUserDetailContext

#pragma mark -
#pragma mark Public

- (NSDictionary *)parameters {
    [super parameters];
    NSString *fields = [NSString stringWithFormat:@"%@,%@{%@}",
                        kFBGenderKey,
                        kFBLargePictureKey,
                        kFBURLKey];
    return @{kFBFieldsKey :fields};
}

- (void)fillModelWithResult:(NSDictionary *)result {
    KSUser *user = self.model;
    
    user.gender = result[kFBGenderKey];
    
    NSString *url = result [kFBPictureKey][kFBDataKey][kFBURLKey];
    user.largeImageURL = [NSURL URLWithString:url];
}

@end
