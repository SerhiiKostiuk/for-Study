//
//  NSDictionary+KSJSONDictionary.m
//  KSProjectUI
//
//  Created by Serg Bla on 05.04.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "NSDictionary+KSJSONRepresentation.h"

@implementation NSDictionary (KSJSONRepresentation)

- (instancetype)JSONRepresentation {
    NSMutableDictionary *dictionary = [NSMutableDictionary new];
    for (id key in self) {
        id result = [self[key] JSONRepresentation];
        if (result) {
            dictionary[key] = result;
        }
    }
    
    return [[self class] dictionaryWithDictionary:dictionary];
}


@end
