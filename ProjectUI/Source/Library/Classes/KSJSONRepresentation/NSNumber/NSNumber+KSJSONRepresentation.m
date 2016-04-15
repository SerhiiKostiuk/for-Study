//
//  NSNumber+KSJSONRepresentation.m
//  KSProjectUI
//
//  Created by Serg Bla on 15.04.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "NSNumber+KSJSONRepresentation.h"

@implementation NSNumber (KSJSONRepresentation)

- (NSString *)JSONRepresentation {
    return self.stringValue;
}

@end
