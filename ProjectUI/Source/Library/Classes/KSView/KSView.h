//
//  KSView.h
//  KSProjectUI
//
//  Created by Serg Bla on 26.02.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^KSVoidBlock)(void);

@interface KSView : UIView
@property (nonatomic, assign, getter=isLoadingViewVisible) BOOL loadingViewVisible;

- (void)setLoadingViewVisible:(BOOL)loadingViewVisible animated:(BOOL)animated;
- (void)setLoadingViewVisible:(BOOL)loadingViewVisible animated:(BOOL)animated completion:(KSVoidBlock)completion;

- (UIView *)indicatorView;

@end
