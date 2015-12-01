//
//  KSStringCategories.h
//  LearningDevelop
//
//  Created by Serg Bla on 26.11.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (KSStringCategory)

+ (instancetype)alphanumericAlphabet;
+ (instancetype)numericAlphabet;
+ (instancetype)lowercaseLetters;
+ (instancetype)uppercaseLetters;
+ (instancetype)letterAlphabet;

+ (instancetype)alphabetWithUnicodeRange:(NSRange)range;

+ (instancetype)randomString;
+ (instancetype)randomStringWithLength:(NSUInteger)length;
+ (instancetype)randomStringWithLength:(NSUInteger)length alphabet:(NSString *)alphabet;

@end
