//
//  KSChecker.h
//  LearningDevelop
//
//  Created by Serg Bla on 29.12.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import <Foundation/Foundation.h>
@class KSCar;

@interface KSChecker : NSObject

+(instancetype)checkerWithEnterprise:(KSEnterprise *)enterprise;


- (void)performWorkWithObject:(KSCar *)car;
- (void)performWorkWithObjects:(NSArray *)cars;

@end
