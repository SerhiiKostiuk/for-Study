//
//  KSSquareView.m
//  KSProjectUI
//
//  Created by Serg Bla on 28.01.16.
//  Copyright © 2016 Serg Bla. All rights reserved.
//

#import "KSSquareView.h"

static NSTimeInterval KSDuration = 1.0;

@implementation KSSquareView

#pragma mark -
#pragma mark Accessors

- (void)setSquarePosition:(KSSquarePosition)squarePosition {
    [self setSquarePosition:squarePosition animated:NO];
}

#pragma mark -
#pragma mark Public

- (void)moveSquare {
    KSSquarePosition newLocation = KSSquarePositionBottomRight;
    
    switch (self.squarePosition) {
        case KSSquarePositionBottomRight:
            newLocation = KSSquarePositionTopRight;
            
            break;
            
        case KSSquarePositionTopRight:
            newLocation = KSSquarePositionTopLeft;
            
            break;
            
        case KSSquarePositionTopLeft:
            newLocation = KSSquarePositionBottomLeft;
            
            break;

        default:
            break;
    }
    
    [self setSquarePosition:newLocation animated:YES];
}

- (void)setSquarePosition:(KSSquarePosition)squarePosition animated:(BOOL)animated {
    [self setSquarePosition:squarePosition animated:animated completionHandler:nil];
}

- (void)setSquarePosition:(KSSquarePosition)squarePosition
                 animated:(BOOL)animated
         completionHandler:(void (^)(BOOL))handler
{
    [UIView animateWithDuration:KSDuration animations:^{
        CGRect squareFrame = self.square.frame;
        CGFloat squareX = CGRectGetWidth(self.frame) - CGRectGetWidth(squareFrame);
        CGFloat squareY = CGRectGetHeight(self.frame) - CGRectGetHeight(squareFrame);
        switch (squarePosition) {
            case KSSquarePositionBottomLeft:
                squareFrame.origin.x = 0;
                squareFrame.origin.y = squareY;
                
                break;
                
            case KSSquarePositionBottomRight:
                squareFrame.origin.x = squareX;
                squareFrame.origin.y = squareY;
                
                break;
                
            case KSSquarePositionTopRight:
                squareFrame.origin.x = squareX;
                squareFrame.origin.y = 0;
                
                break;
                
            case KSSquarePositionTopLeft:
                squareFrame.origin.x = 0;
                squareFrame.origin.y = 0;
                
                break;
                
            default:
                break;
        }
        
        self.square.frame = squareFrame;
        
        _squarePosition = squarePosition;
        
    } completion:handler];
}

@end
