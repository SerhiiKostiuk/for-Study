//
//  NSArray+KSJSONRepresentation.m
//  KSProjectUI
//
//  Created by Serg Bla on 05.04.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "NSArray+KSJSONRepresentation.h"

@implementation NSArray (KSJSONRepresentation)

- (instancetype)JSONRepresentation {
    return [NSArray arrayWithArray:[self mutableJSONRepresentation]];
}

- (NSMutableArray *)mutableJSONRepresentation {
    NSMutableArray *array = [NSMutableArray new];
    for (id object in self) {
        id result = [object JSONRepresentation];
        if (result) {
            [array addObject:result];
        }
    }
    
    return array;
}

@end

@implementation NSMutableArray (KSJSONRepresentation)

- (instancetype)JSONRepresentation {
    return [NSMutableArray arrayWithArray:[self mutableJSONRepresentation]];
}

@end