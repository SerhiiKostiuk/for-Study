//
//  KSRangeAlphabet.h
//  LearningDevelop
//
//  Created by Serg Bla on 02.12.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import "KSAlphabet.h"

@interface KSRangeAlphabet : KSAlphabet

@property (nonatomic, readonly) NSRange range;

- (instancetype)initWithRange:(NSRange)range;

@end
