//
//  KSSquareView.h
//  KSProjectUI
//
//  Created by Serg Bla on 28.01.16.
//  Copyright © 2016 Serg Bla. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, KSSquarePosition) {
    KSSquarePositionTopLeft,
    KSSquarePositionTopRight,
    KSSquarePositionBottomLeft,
    KSSquarePositionBottomRight,
    KSSquarePositionCount
};

typedef void(^KSVoidBlock)(void);

@interface KSSquareView : UIView
@property (nonatomic, strong) IBOutlet    UILabel       *squareLabel;
@property (nonatomic, strong) IBOutlet    UIView        *areaView;
@property (nonatomic, strong) IBOutlet    UIButton      *moveButton;
@property (nonatomic, strong) IBOutlet    UIButton      *startButton;
@property (nonatomic, strong) IBOutlet    UIButton      *stopButton;
@property (nonatomic, assign) KSSquarePosition          squarePosition;

@property (nonatomic, readonly, getter=isAnimating)    BOOL   animating;
@property (nonatomic, assign, getter=isCycleAnimating) BOOL   cycleAnimating;

- (void)setSquarePosition:(KSSquarePosition)squarePosition animated:(BOOL)animated;
- (void)setSquarePosition:(KSSquarePosition)squarePosition
                 animated:(BOOL)animated
        completionHandler:(KSVoidBlock)handler;

- (void)moveSquareToNextPosition;

@end
