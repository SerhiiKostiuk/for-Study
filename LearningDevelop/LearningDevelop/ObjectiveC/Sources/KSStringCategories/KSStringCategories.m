//
//  KSStringCategories.m
//  LearningDevelop
//
//  Created by Serg Bla on 26.11.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import "KSStringCategories.h"

//@protocol KSStringProtocol <NSObject>
//
//- (NSUInteger)count;
//
//- (NSString *)symbolAtIndex:(NSUInteger)index;
//
//@end

#define KSNumericRange NSMakeRange( '0', '9' - '0' + 1)
#define KSLowercaseLettersRange NSMakeRange('a', 'z' - 'a' + 1)
#define KSUppercaseLettersRange NSMakeRange('A', 'Z' - 'A' + 1)

static const NSUInteger kKSStringDefaultRandomStringWithLength = 32;

@implementation NSString (KSStringCategory)

#pragma mark -
#pragma mark Alphabets

+ (instancetype)alphanumericAlphabet {
    NSMutableString *result = [NSMutableString stringWithString:[self letterAlphabet]];
    [result appendString:[self numericAlphabet]];
    
    return [self stringWithString:result];
}

+ (instancetype)numericAlphabet {
    return [self alphabetWithUnicodeRange:KSNumericRange];
}

+ (instancetype)lowercaseLetters {
    return [self alphabetWithUnicodeRange:KSLowercaseLettersRange];
}

+ (instancetype)uppercaseLetters {
    return [self alphabetWithUnicodeRange:KSUppercaseLettersRange];

}

+ (instancetype)letterAlphabet {
    NSMutableString *result = [NSMutableString string];
    
    [result appendString:[self lowercaseLetters]];
    [result appendString:[self uppercaseLetters]];
    
    return [self stringWithString:result];
}

+ (instancetype)alphabetWithUnicodeRange:(NSRange)range {
    NSMutableString *result = [NSMutableString string];
    for (unichar character = range.location; character < NSMaxRange(range); character++) {
        [result appendFormat:@"%C", character];
    }
    
    return [self stringWithString:result];
}

#pragma mark -
#pragma mark Class Methods

+ (instancetype)randomString {
    return [self randomStringWithLength:arc4random_uniform(kKSStringDefaultRandomStringWithLength)];
}

+ (instancetype)randomStringWithLength:(NSUInteger)length {
    return [self randomStringWithLength:length alphabet:[self alphanumericAlphabet]];
}

+ (instancetype)randomStringWithLength:(NSUInteger)length alphabet:(NSString *)alphabet {
    NSMutableString *string = [NSMutableString stringWithCapacity:length];
    NSUInteger alphabetLength = [alphabet length];
    
    for (NSUInteger index = 0; index < length; index++) {
        unichar resultChar = [alphabet characterAtIndex:arc4random_uniform((u_int32_t)alphabetLength)];
        [string appendFormat:@"%C",resultChar];
    }
    
    return [self stringWithString:string];
}
 
@end
