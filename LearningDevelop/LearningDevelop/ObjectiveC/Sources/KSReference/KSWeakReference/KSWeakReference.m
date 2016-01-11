//
//  KSWeakRefepence.m
//  LearningDevelop
//
//  Created by Serg Bla on 20.12.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import "KSWeakReference.h"

@interface KSWeakReference ()
@property (nonatomic, assign) id target;

@end

@implementation KSWeakReference

@synthesize target = _target;

@end
