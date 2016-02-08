//
//  CGGeometry+KSExtensions.h
//  KSProjectUI
//
//  Created by Serg Bla on 04.02.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import <UIKit/UIKit.h>

// Return the width of `frame'.
#define CGWidth(frame) CGRectGetWidth(frame)

// Return the height of `frame'.
#define CGHeight(frame) CGRectGetHeight(frame)

// Return the leftmost x-value of `frame'.
#define CGMinX(frame) CGRectGetMinX(frame)

// Return the midpoint x-value of `frame'.
#define CGMidX(frame) CGRectGetMidX(frame)

// Return the rightmost x-value of `frame'.
#define CGMaxX(frame) CGRectGetMaxX(frame)

// Return the bottommost y-value of `frame'.
#define CGMinY(frame) CGRectGetMinY(frame)

// Return the midpoint y-value of `frame'.
#define CGMidY(frame) CGRectGetMidY(frame)

// Return the topmost y-value of `frame'.
#define CGMaxY(frame) CGRectGetMaxY(frame)

extern
CGPoint KSPointBySubtractingRects(CGRect minuend, CGRect subtrahend);