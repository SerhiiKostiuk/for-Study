//
//  KSSquareView.m
//  KSProjectUI
//
//  Created by Serg Bla on 28.01.16.
//  Copyright © 2016 Serg Bla. All rights reserved.
//

#import "KSSquareView.h"

#import "KSWeakifyMacro.h"
#import "CGGeometry+KSExtensions.h"

static NSTimeInterval KSDuration = 1.0;

@interface KSSquareView ()

- (KSSquarePosition)nextPositionWithSquarePosition:(KSSquarePosition)position;
- (void)moveSquareToNextPositionWithAnimatedCompletionHandler;
- (CGRect)squareFrameWithSquarePosition:(KSSquarePosition)position;

@end

@implementation KSSquareView

#pragma mark -
#pragma mark Accessors

- (void)setSquarePosition:(KSSquarePosition)squarePosition {
    [self setSquarePosition:squarePosition animated:NO];
}

- (void)setCycleAnimating:(BOOL)cycleAnimating {
    if (_cycleAnimating != cycleAnimating) {
        _cycleAnimating = cycleAnimating;
        [self moveSquareToNextPositionWithAnimatedCompletionHandler];
    }
}

#pragma mark -
#pragma mark Public

- (void)moveSquareToNextPosition {
    [self moveSquareToNextPositionWithAnimatedCompletionHandler];
}

- (void)setSquarePosition:(KSSquarePosition)squarePosition animated:(BOOL)animated {
    [self setSquarePosition:squarePosition animated:animated completionHandler:nil];
}

- (void)setSquarePosition:(KSSquarePosition)squarePosition
                 animated:(BOOL)animated
        completionHandler:(KSVoidBlock)handler
{
    [UIView animateWithDuration:animated ? KSDuration : 0.0
                     animations:^{
                         self.squareLabel.frame = [self squareFrameWithSquarePosition:squarePosition];
                     }
                     completion:^(BOOL finished) {
                         if (finished) {
                             _squarePosition = squarePosition;
                         }
                         
                         if (handler) {
                             handler();
                         }
                     }];
}

#pragma mark -
#pragma mark Private

- (void)moveSquareToNextPositionWithAnimatedCompletionHandler {
    KSWeakify(self);
    [self setSquarePosition:[self nextPositionWithSquarePosition:self.squarePosition]
                   animated:YES
          completionHandler:^{
              KSStrongifyAndReturnIfNil(self);
              if (self.cycleAnimating) {
                  [self moveSquareToNextPositionWithAnimatedCompletionHandler];
              }
          }];
}

- (KSSquarePosition)nextPositionWithSquarePosition:(KSSquarePosition)position {
    switch (position) {
        case KSSquarePositionBottomRight:
            return KSSquarePositionTopRight;
            
        case KSSquarePositionTopRight:
            return KSSquarePositionTopLeft;
            
        case KSSquarePositionTopLeft:
            return KSSquarePositionBottomLeft;
            
        default:
            return KSSquarePositionBottomRight;
    }
}

- (CGRect)squareFrameWithSquarePosition:(KSSquarePosition)position {
    CGRect squareFrame = self.squareLabel.frame;
    CGPoint visibleOrign = getPointByRectsSubtracting(self.areaView.bounds, squareFrame);
    
    CGPoint origin = CGPointZero;
    switch (position) {
        case KSSquarePositionBottomLeft: 
            origin.y = visibleOrign.y;
            break;
            
        case KSSquarePositionBottomRight:
            origin = visibleOrign;
            break;
            
        case KSSquarePositionTopRight:
            origin.x = visibleOrign.x;
            break;
            
        default:
            break;
    }
    
    squareFrame.origin = origin;
    
    return squareFrame;
}

@end
