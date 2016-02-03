//
//  KSSquareViewController.m
//  KSProjectUI
//
//  Created by Serg Bla on 28.01.16.
//  Copyright © 2016 Serg Bla. All rights reserved.
//

#import "KSSquareViewController.h"
#import "KSSquareView.h"
#import "KSMacro.h"

@interface KSSquareViewController ()
@property (nonatomic, readonly) KSSquareView  *squareView;

@end

@implementation KSSquareViewController
 
@dynamic squareView;

KSViewGetterSynthesize(KSSquareView, squareView);

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)onMoveButton:(id)sender {
    [self.squareView moveSquareToNextPosition];
}

- (IBAction)OnStartButton:(id)sender {
    KSSquareView *squareView = self.squareView;
    if (!squareView.isAnimated) {
        squareView.animated = YES;
        [squareView animateSquareMoving];
    }
}

- (IBAction)OnStopButton:(id)sender {
    self.squareView.animated = NO;    
}

@end
