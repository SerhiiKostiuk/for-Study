//
//  KSSquareView.m
//  KSProjectUI
//
//  Created by Serg Bla on 28.01.16.
//  Copyright © 2016 Serg Bla. All rights reserved.
//

#import "KSSquareView.h"

#import "KSMacro.h"

static NSTimeInterval KSDuration = 1.0;

@interface KSSquareView ()

- (KSSquarePosition)nextPosition:(KSSquarePosition)position;
- (CGRect)squareFrameWithSqurePosition:(KSSquarePosition)position;

@end

@implementation KSSquareView

#pragma mark -
#pragma mark Accessors

- (void)setSquarePosition:(KSSquarePosition)squarePosition {
    [self setSquarePosition:squarePosition animated:NO];
}

#pragma mark -
#pragma mark Public

- (void)moveSquareToNextPosition {
    KSSquarePosition position = [self nextPosition:self.squarePosition];
    
    [self setSquarePosition:position animated:YES];
}

- (void)animateSquareMoving {
    if (self.isAnimated) {
        [self moveSquareToNextPosition];
    }
}

- (KSSquarePosition)nextPosition:(KSSquarePosition)position {
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

- (void)setSquarePosition:(KSSquarePosition)squarePosition animated:(BOOL)animated {
    [self setSquarePosition:squarePosition animated:animated completionHandler:nil];
}

- (void)setSquarePosition:(KSSquarePosition)squarePosition
                 animated:(BOOL)animated
        completionHandler:(KSVoidBlock)handler
{
    [UIView animateWithDuration:animated ? KSDuration : 0.0
                     animations:^{
                         self.squareLabel.frame = [self squareFrameWithSqurePosition:squarePosition];
                     }
                     completion:^(BOOL finished) {
                         if (finished) {
                             _squarePosition = squarePosition;
                             
                             [self animateSquareMoving];
                         }
                         
                         if (handler) {
                             handler();
                         }
                     }];
}

- (CGRect)squareFrameWithSqurePosition:(KSSquarePosition)position {
    CGRect squareFrame = self.squareLabel.frame;
    CGRect areaViewFrame = self.areaView.frame;
    CGFloat pointLocationOnXaxis = CGWidth(areaViewFrame) - CGWidth(squareFrame);
    CGFloat pointLocationOnYaxis = CGHeight(areaViewFrame) - CGHeight(squareFrame);
    
    CGPoint origin = CGPointZero;
    switch (position) {
        case KSSquarePositionBottomLeft:
            origin.y = pointLocationOnYaxis;
            break;
            
        case KSSquarePositionBottomRight:
            origin.x = pointLocationOnXaxis;
            origin.y = pointLocationOnYaxis;
            break;
            
        case KSSquarePositionTopRight:
            origin.x = pointLocationOnXaxis;
            break;
            
        default:
            break;
    }
    
    squareFrame.origin = origin;
    
    return squareFrame;
}

@end
