//
//  KSStringsAlphabet.m
//  LearningDevelop
//
//  Created by Serg Bla on 02.12.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import "KSStringsAlphabet.h"

@interface KSStringsAlphabet ()

@property (nonatomic, retain) NSArray *strings;

@end

@implementation KSStringsAlphabet

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.strings = nil;
    
    [super dealloc];
}

- (instancetype)initWithStrings:(NSArray *)strings {
    self = [super init];
    if (self) {
        self.strings =  strings;
    }
    return self;
}

#pragma mark -
#pragma mark Public Methods


- (NSUInteger)count {
    return [self.strings count];
}
- (NSString *)stringAtIndex:(NSUInteger)index {
    return self.strings[index];
}

#pragma mark -
#pragma mark NSFastEnumeration

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state
                                  objects:(id _Nonnull [])stackbuf
                                    count:(NSUInteger)resultLength
{
    return [self.strings countByEnumeratingWithState:state
                                             objects:stackbuf
                                               count:resultLength];
}


@end
