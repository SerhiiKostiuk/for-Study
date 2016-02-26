//
//  KSView.h
//  KSProjectUI
//
//  Created by Serg Bla on 26.02.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KSView : UIView
@property (nonatomic, assign, getter=isLoadingViewVisible) BOOL loadingViewVisible;

- (void)setLoadingViewVisible:(BOOL)loadingViewVisible animated:(BOOL)animated;
- (void)setLoadingViewVisible:(BOOL)loadingViewVisible animated:(BOOL)animated completion:(id)completion;

- (UIView *)loadingView;
@end
