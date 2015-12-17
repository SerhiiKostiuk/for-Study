//
//  director.h
//  LearningDevelop
//
//  Created by Serg Bla on 08.12.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KSEmployee.h"

@interface KSDirector : KSEmployee

- (void)performPositionSpecificOperation:(KSEmployee *)accountant;

@end
