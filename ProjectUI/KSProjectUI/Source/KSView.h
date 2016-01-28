//
//  KSView.h
//  KSProjectUI
//
//  Created by Serg Bla on 28.01.16.
//  Copyright © 2016 Serg Bla. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, KSSqurePosition) {
    squrePositionTopLeft,
    squrePositionTopRight,
    squrePositionBottomLeft,
    squrePositionBottomRight
};

@interface KSView : UIView
@property (nonatomic, strong) IBOutlet    UILabel   *squre;
@property (nonatomic, assign) NSUInteger            squrePosition;

@end
