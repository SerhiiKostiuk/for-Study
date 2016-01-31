//
//  KSSquareViewController.m
//  KSProjectUI
//
//  Created by Serg Bla on 28.01.16.
//  Copyright © 2016 Serg Bla. All rights reserved.
//

#import "KSSquareViewController.h"
#import "KSSquareView.h"

@interface KSSquareViewController ()
@property (nonatomic, readonly) KSSquareView  *squareView;

@end

@implementation KSSquareViewController

@dynamic squareView;

- (KSSquareView *)squareView {
    if ([self isViewLoaded] && [self.view isKindOfClass:[KSSquareView class]]) {
        return (KSSquareView *)self.view;
    }
    
    return nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)onMoveButton:(id)sender {
    [self.squareView moveSquare];
}

@end
