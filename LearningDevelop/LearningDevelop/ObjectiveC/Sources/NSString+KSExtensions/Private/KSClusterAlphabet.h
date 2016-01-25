//
//  KSClusterAlphabet.h
//  LearningDevelop
//
//  Created by Serg Bla on 02.12.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import "KSAlphabet.h"

@interface KSClusterAlphabet : KSAlphabet

@property(nonatomic, readonly) NSArray *alphabets;


- (instancetype)initWithAlphabets:(NSArray *)alphabets;

@end
