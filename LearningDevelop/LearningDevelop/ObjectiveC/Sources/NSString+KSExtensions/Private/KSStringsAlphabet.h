//
//  KSStringsAlphabet.h
//  LearningDevelop
//
//  Created by Serg Bla on 02.12.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import "KSAlphabet.h"

@interface KSStringsAlphabet : KSAlphabet

@property (nonatomic, readonly) NSArray *strings;

- (instancetype)initWithStrings:(NSArray *)strings;

@end
