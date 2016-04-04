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


- (void)fillModelWithResult:(NSDictionary *)result {
    KSUser *user = self.model;
    user.ID = result[kFBIdKey];
    user.firstName = result[kFBFirstNameKey];
    user.lastName = result[kFBLastNameKey];
    NSString *url = result [kFBPictureKey][kFBDataKey][kFBURLKey];
    user.previewImageURL = [NSURL URLWithString:url];
}

@end
