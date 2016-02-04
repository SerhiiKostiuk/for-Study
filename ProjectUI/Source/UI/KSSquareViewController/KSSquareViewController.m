//
//  KSSquareViewController.m
//  KSProjectUI
//
//  Created by Serg Bla on 28.01.16.
//  Copyright © 2016 Serg Bla. All rights reserved.
//

#import "KSSquareViewController.h"
#import "KSSquareView.h"

#import "UIViewController+KSExtensions.h"

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
    self.squareView.cycleAnimating = YES;
}

- (IBAction)OnStopButton:(id)sender {
    self.squareView.cycleAnimating = NO;
}

@end