//
//  KSUserContext.m
//  KSProjectUI
//
//  Created by Serg Bla on 04.04.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSUserContext.h"
#import "KSFacebookConstants.h"
#import "KSUser.h"

@implementation KSUserContext

#pragma mark -
#pragma mark Public

- (NSString *)path {
    KSUser *user = self.model;
    
    return user.ID;
}

- (NSDictionary *)parameters {
    NSString *fields = [NSString stringWithFormat:@"%@,%@,%@{%@}",
                        kFBFirstNameKey,
                        kFBLastNameKey,
                        kFBPictureKey,
                        kFBURLKey];
    
    return @{kFBFieldsKey :fields};
}

- (NSUInteger)shouldLoadState:(NSUInteger)state {
    if (KSModelStateFinishedLoading == state ||
        KSModelDetailStateFinishedLoading == state ||
        KSModelStateLoading == state)
    {
        return state;
    }
    
    return 0;
}

- (void)fillModelWithResult:(NSDictionary *)result {
    KSUser *user = self.model;
    
    user.ID = result[kFBIdKey];
    user.firstName = result[kFBFirstNameKey];
    user.lastName = result[kFBLastNameKey];
    
    NSString *url = result [kFBPictureKey][kFBDataKey][kFBURLKey];
    user.previewImageURL = [NSURL URLWithString:url];
}


@end
