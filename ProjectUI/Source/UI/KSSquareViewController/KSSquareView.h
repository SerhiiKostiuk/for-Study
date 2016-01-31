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
    KSSquarePositionBottomRight
};

@interface KSSquareView : UIView
@property (nonatomic, strong) IBOutlet    UILabel   *square;
@property (nonatomic, strong) IBOutlet    UIButton  *moveButton;
@property (nonatomic, assign) KSSquarePosition      squarePosition;

- (void)moveSquare;

- (void)setSquarePosition:(KSSquarePosition)squarePosition animated:(BOOL)animated;
- (void)setSquarePosition:(KSSquarePosition)squarePosition
                 animated:(BOOL)animated
         comletionHandler:(void (^)(BOOL))handler;

@end
