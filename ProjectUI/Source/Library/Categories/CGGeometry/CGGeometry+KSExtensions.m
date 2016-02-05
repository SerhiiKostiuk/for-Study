//
//  CGGeometry+KSExtensions.m
//  KSProjectUI
//
//  Created by Serg Bla on 04.02.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "CGGeometry+KSExtensions.h"

CGPoint KSPointBySubtractingRects(CGRect minuend, CGRect subtrahend){
    return CGPointMake(CGMaxX(minuend) - CGWidth(subtrahend),
                       CGMaxY(minuend) - CGHeight(subtrahend));
}
