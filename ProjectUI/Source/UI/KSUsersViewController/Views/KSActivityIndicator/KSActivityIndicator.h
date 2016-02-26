//
//  KSWaitActivityView.h
//  KSProjectUI
//
//  Created by Serg Bla on 25.02.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KSActivityIndicator : UIView
@property (nonatomic, strong) IBOutlet UIActivityIndicatorView  *activityIndicatorView;

+ (instancetype)indicatorWithSuperView:(UIView *)superView;

@end
