//
//  CGGeometry+KSExtensions.h
//  KSProjectUI
//
//  Created by Serg Bla on 04.02.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#define CGWidth(frame) CGRectGetWidth(frame)
#define CGHeight(frame) CGRectGetHeight(frame)

#import <UIKit/UIKit.h>

CGPoint getPointByRectsSubtracting(CGRect minuend, CGRect subtrahend);