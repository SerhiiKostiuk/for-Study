//
//  accountant.h
//  LearningDevelop
//
//  Created by Serg Bla on 08.12.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import "employee.h"
@class washer;

@interface accountant : employee
- (void)performPositionSpecificOperation:(employee *)washer;
@end
