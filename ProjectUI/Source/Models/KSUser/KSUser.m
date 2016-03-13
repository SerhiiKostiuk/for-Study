//
//  KSUser.m
//  KSProjectUI
//
//  Created by Serg Bla on 09.02.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSUser.h"

#import "KSImageModel.h"

#import "NSString+KSRandomName.h"
#import "NSFileManager+KSExtensions.h"

static NSString * const kKSStringURL = @"http://bitemybark.com/wp-content/uploads/2014/09/what-the-fuck-is-this.jpg";

static NSString * const kKSNameKey = @"name";

@implementation KSUser

@dynamic imageModel;

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];    
    if (self) {
        self.name = [NSString randomName];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (KSImageModel *)imageModel {
    return [KSImageModel imageWithUrl:[NSURL URLWithString:kKSStringURL]];
}

#pragma mark -
#pragma mark Private

//- (void)performBackgroundLoading {
//    
//}

#pragma mark -
#pragma mark NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.name forKey:kKSNameKey];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self.name = [aDecoder decodeObjectForKey:kKSNameKey];
    
    return self;
}

@end
