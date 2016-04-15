//
//  KSViewController.h
//  KSProjectUI
//
//  Created by Serg Bla on 20.03.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "KSModelObserver.h"

@class KSContext;
@class KSUser;

@interface KSViewController : UIViewController <KSModelObserver>
@property (nonatomic, strong) KSContext *context;
@property (nonatomic, strong) KSUser *user;

// this method should be overload in subclass
- (void)updateViewController;

@end
