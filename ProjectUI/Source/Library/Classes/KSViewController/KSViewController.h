//
//  KSViewController.h
//  KSProjectUI
//
//  Created by Serg Bla on 20.03.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "KSModelObserver.h"

@class KSFacebookLoginContext;

@interface KSViewController : UIViewController <KSModelObserver>
@property (nonatomic, strong) KSFacebookLoginContext *context;


@end
