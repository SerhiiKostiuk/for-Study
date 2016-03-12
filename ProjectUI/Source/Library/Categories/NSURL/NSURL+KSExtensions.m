//
//  NSURL+KSExtensions.m
//  KSProjectUI
//
//  Created by Serg Bla on 12.03.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "NSURL+KSExtensions.h"

#import "NSString+KSExtensions.h"

static NSString * const kKSQuestionSymbol = @"?";
static NSString * const kKSSlashSymbol = @"/";
static NSString * const kKSUnderscoreSymbol = @"_";
static NSString * const kKSMinusSymbol = @"-";

@implementation NSURL (KSExtensions)

#pragma mark -
#pragma mark Public

- (NSString *)fileSystemStringRepresentation {
    NSDictionary *subtitutions = [self fileSystemSubstitutionDictionary];
    
    return [[self absoluteString] stringByReplacingOccurrencesOfKeysWithValuesInDictionary:subtitutions];
}

#pragma mark -
#pragma mark Private

- (NSDictionary *)fileSystemSubstitutionDictionary {
    static NSDictionary *result = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{        
        result = @{kKSQuestionSymbol : kKSMinusSymbol,
                   kKSSlashSymbol : kKSUnderscoreSymbol};
    });
    
    return result;
}

@end
