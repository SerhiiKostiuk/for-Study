//
//  carWashBuilding.h
//  LearningDevelop
//
//  Created by Serg Bla on 08.12.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import "buildings.h"

@interface carWashBuilding : buildings

+ (instancetype)building;

+ (BOOL)canContainItemOfClass:(Class)itemClass;

@end
