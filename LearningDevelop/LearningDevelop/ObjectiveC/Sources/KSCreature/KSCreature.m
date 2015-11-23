//
//  KSCreature.m
//  LearningDevelop
//
//  Created by Serg Bla on 21.11.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import "KSCreature.h"

@interface KSCreature ()

@property (nonatomic, readwrite, copy) NSString *name;
@property (nonatomic, retain) NSMutableSet *mutableKids;
@property (readwrite) KSCreatureGenderType gender;

@end

@implementation KSCreature

@dynamic kids;

#pragma mark -
#pragma mark Class Methods

+ (KSCreature *)creature {
    return [self creatureWithName:(NSString *)nil gender:kKSCreatureGenderUndefiened];
}

+ (KSCreature *)creatureWithName:(NSString *)name gender:(KSCreatureGenderType)gender {
    return [[[self alloc] initWithName:name gender:gender] autorelease];
}

#pragma mark -
#pragma mark Initializations and Deallocations


- (void)dealloc {
    self.name = nil;
    self.mutableKids = nil;
    
    [super dealloc];
}

-(instancetype)init {
    self = [super init];
    if (self) {
        self.mutableKids = [[[NSMutableSet alloc] init] autorelease];
    }
    
    return self;
}

- (instancetype)initWithName:(NSString *)name gender:(KSCreatureGenderType)gender {
    self = [self init];
    if (self) {
        self.name = name;
        self.gender = gender;
    }
    
    return self;
}


#pragma mark -
#pragma mark Accesors

- (NSSet *)kids {
    return [[_mutableKids copy] autorelease];
}

#pragma mark-
#pragma mark Public Methods

- (void)sayHi {
    NSLog(@"Hi from %@", self.name);
    for (KSCreature *kid in self.mutableKids) {
        [kid sayHi];
    }
    
}

- (void)goFight {
    
}

- (void)goReproduce {
    
}

- (void)addKid:(KSCreature *) kid {
    if ([kid isKindOfClass:[self class]]) {
        [self.mutableKids addObject:kid];
    }
    
}

- (void)removeKid:(KSCreature *) kid {
    [self.mutableKids removeObject:kid];
}

@end
