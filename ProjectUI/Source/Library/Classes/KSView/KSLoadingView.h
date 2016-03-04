//
//  KSLoadingView.h
//  KSProjectUI
//
//  Created by Serg Bla on 04.03.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^KSVoidBlock)(void);

@protocol KSLoadingView <NSObject>
@property (nonatomic, assign, getter=isVisible) BOOL visible;

- (void)setVisible:(BOOL)visible animated:(BOOL)animated;
- (void)setVisible:(BOOL)visible animated:(BOOL)animated completion:(KSVoidBlock)completion;

@end
