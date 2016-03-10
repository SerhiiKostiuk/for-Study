//
//  NSString+KSExtensions.m
//  LearningDevelop
//
//  Created by Serg Bla on 26.11.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import "NSString+KSExtensions.h"

#define KSNumericRange NSMakeRange( '0', '9' - '0' + 1)
#define KSLowercaseLettersRange NSMakeRange('a', 'z' - 'a' + 1)
#define KSUppercaseLettersRange NSMakeRange('A', 'Z' - 'A' + 1)

static const NSUInteger kKSStringDefaultRandomStringWithLength = 32;

static NSString * const kKSQuestionSymbol = @"?";
static NSString * const kKSSlashSymbol = @"/";
static NSString * const kKSUnderscoreSymbol = @"_";
static NSString * const kKSMinusSymbol = @"-";

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

#pragma mark -
#pragma mark Public

- (NSArray *)symbols {
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:[self length]];
    NSUInteger length = [self length];
    
    for (NSUInteger index = 0; index < length; index++) {
        unichar resultChar = [self characterAtIndex:index];
        [result addObject:[NSString stringWithFormat:@"%C",resultChar]];
    }
    
    return [result copy];
}

- (NSString *)nameFromUrl:(NSURL *)url {
    NSString *string = [url absoluteString];
    
    string = [string stringByReplacingOccurrencesOfString:kKSQuestionSymbol withString:kKSMinusSymbol];
    string = [string stringByReplacingOccurrencesOfString:kKSSlashSymbol    withString:kKSMinusSymbol];
    
    return string;
}

- (NSString *)stringByReplacingSymbolOfString:(NSString *)target withString:(NSString *)replacement {
    NSString *string = nil;
    [string stringByReplacingOccurrencesOfString:target withString:replacement];
    
    return string;
}

@end
