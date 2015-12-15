//
//  director.m
//  LearningDevelop
//
//  Created by Serg Bla on 08.12.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import "director.h"

@implementation director

- (void)performPositionSpecificOperation:(employee *)accountant {
    [accountant giveMoney:self.money toReciver:self];
    
}
@end
