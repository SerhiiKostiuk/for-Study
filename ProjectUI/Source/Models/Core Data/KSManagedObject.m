//
//  KSManagedObject.m
//  KSProjectUI
//
//  Created by Serg Bla on 21.04.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSManagedObject.h"

#import "KSObservableObject.h"

@interface KSManagedObject ()
@property (nonatomic, strong) KSObservableObject *observableObject;

@end

@implementation KSManagedObject
@synthesize observableObject = _obervableObject;

- (instancetype)initWithEntity:(NSEntityDescription *)entity
insertIntoManagedObjectContext:(NSManagedObjectContext *)context
{
    self = [super initWithEntity:entity insertIntoManagedObjectContext:context];
    self.observableObject = [[KSObservableObject alloc] initWithTarget:self];
    
    return self;
}

- (id)forwardingTargetForSelector:(SEL)selector {
    id observableObject = self.observableObject;
    if ([observableObject respondsToSelector:selector]) {
        return observableObject;
    }
    
    return [super forwardingTargetForSelector:selector];
}

@end
