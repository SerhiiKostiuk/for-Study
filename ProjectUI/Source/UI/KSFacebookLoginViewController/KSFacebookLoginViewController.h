//
//  KSFacebookLoginViewController.h
//  KSProjectUI
//
//  Created by Serg Bla on 16.03.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "KSViewController.h"

@class KSUser;

@interface KSFacebookLoginViewController : KSViewController
@property (nonatomic, strong) KSUser *user;

- (IBAction)onLogin:(id)sender;

@end