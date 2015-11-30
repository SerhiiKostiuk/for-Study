//
//  KSStringCategories.m
//  LearningDevelop
//
//  Created by Serg Bla on 26.11.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import "KSStringCategories.h"

@protocol KSStringProtocol <NSObject>

- (NSUInteger)count;

- (NSString *)symbolAtIndex:(NSUInteger)index;

@end
@implementation NSString (KSStringCategory)

#pragma mark -
#pragma mark Class Methods

+ (instancetype)randomStringWithLength:(NSUInteger)length alphabet:(NSString *)alphabet {
    NSMutableString *string = [NSMutableString string];
    NSUInteger alphabetCount = [alphabet count];
    
    for (NSUInteger index = 0; index < length; index++) {
        [string appendString:[alphabet symbolAtIndex:(NSUInteger)arc4random_uniform((u_int32_t)alphabetCount)]];
    }
    
    return [self stringWithString:string];
}
 
#pragma mark -
#pragma mark Private Implementations

- (NSUInteger)count {
    return [self length];
}

- (NSString *)symbolAtIndex:(NSUInteger)index {
    unichar symbol = [self characterAtIndex:index];
    return [NSString stringWithFormat:@"%C",symbol];
}


@end
