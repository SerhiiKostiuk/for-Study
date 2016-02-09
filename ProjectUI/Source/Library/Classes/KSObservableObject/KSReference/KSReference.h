//
//  KSReference.h
//  LearningDevelop
//
//  Created by Serg Bla on 20.12.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KSReference : NSObject
@property (nonatomic, retain) id target;

- (instancetype)initWithTarget:(id)target;

@end
