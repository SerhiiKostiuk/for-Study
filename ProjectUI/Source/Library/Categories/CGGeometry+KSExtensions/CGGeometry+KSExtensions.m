//
//  CGGeometry+KSExtensions.m
//  KSProjectUI
//
//  Created by Serg Bla on 04.02.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "CGGeometry+KSExtensions.h"

@implementation NSValue (KSExtensions)

CGPoint getPointByRectsSubtracting(CGRect minuend, CGRect subtrahend){
    return CGPointMake(CGRectGetMaxX(minuend) - CGWidth(subtrahend),
                       CGRectGetMaxY(minuend) - CGHeight(subtrahend));
}

@end
