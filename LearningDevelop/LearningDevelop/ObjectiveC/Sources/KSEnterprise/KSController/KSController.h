//
//  KSController.h
//  LearningDevelop
//
//  Created by Serg Bla on 19.01.16.
//  Copyright © 2016 Serg Bla. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KSController : NSObject
@property (nonatomic, getter=isWorking) BOOL working;

- (void)startWork;
- (void)stopWork;
@end
