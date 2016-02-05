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

static const NSTimeInterval KSDuration = 1.0;

@interface KSSquareView ()
@property (nonatomic, assign, getter=isAnimating)    BOOL  animating;
@property (nonatomic, assign, getter=isCycleStoped)  BOOL  cycleStoped;

- (KSSquarePosition)nextPositionWithSquarePosition:(KSSquarePosition)position;
- (void)moveSquareToNextPositionWithCompletionHandler:(id)handler;
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
        if (cycleAnimating) {
        if (!self.animating) {
            _cycleAnimating = cycleAnimating;
            KSWeakify(self);
            [self moveSquareToNextPositionWithCompletionHandler:^{
                void (^nextPosition)(void) = ^() {
                    KSStrongifyAndReturnIfNil(self);
                    [self moveSquareToNextPositionWithCompletionHandler:nextPosition];
                };
            }];
        }
        } else {
            _cycleAnimating = cycleAnimating;
            self.cycleStoped = YES;
        }
    }
}

#pragma mark -
#pragma mark Public

- (void)moveSquareToNextPosition {
    if (!self.animating) {
        [self moveSquareToNextPositionWithCompletionHandler:nil];
    }
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

- (void)moveSquareToNextPositionWithCompletionHandler:(id)handler {
    [self setSquarePosition:[self nextPositionWithSquarePosition:self.squarePosition]
                   animated:YES
          completionHandler:handler];
}

- (KSSquarePosition)nextPositionWithSquarePosition:(KSSquarePosition)position {
    return (position + 1) % KSSquarePositionCount;
}

- (CGRect)squareFrameWithSquarePosition:(KSSquarePosition)position {
    CGRect squareFrame = self.squareLabel.frame;
    CGPoint visibleOrign = KSPointBySubtractingRects(self.areaView.bounds, squareFrame);
    
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
