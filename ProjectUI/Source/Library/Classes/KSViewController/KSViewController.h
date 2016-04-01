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

@interface KSViewController : UIViewController <KSModelObserver>
@property (nonatomic, strong) KSContext *context;

// this method should be overload in subclass
- (void)updateViewController;

@end
