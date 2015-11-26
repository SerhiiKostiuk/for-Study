//
//  KSCreature.m
//  LearningDevelop
//
//  Created by Serg Bla on 21.11.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import "KSMan.h"
#import "KSWoman.h"
#import "KSCreature.h"

static NSMutableDictionary *__genderClasses = nil;

@interface KSCreature ()

@property (nonatomic, readwrite, copy) NSString *name;
@property (nonatomic, retain) NSMutableSet *mutableKids;
//@property (nonatomic, readwrite) KSCreatureGenderType gender;

@end

@implementation KSCreature

@dynamic kids;
@synthesize gender =_gender;
@synthesize age = _age;
@synthesize weight = _weight;

#pragma mark -
#pragma mark Class Methods

+ (void)load {
    [super load];
    __genderClasses = [NSMutableDictionary dictionaryWithDictionary:@{@(kKSCreatureGenderMale)   : [KSMan class],
                                                                      @(kKSCreatureGenderFemale) : [KSWoman class]}];
}

+ (instancetype)creature {
    return [self creatureWithName:(NSString *)nil gender:kKSCreatureGenderMale];
}

+ (instancetype)creatureWithName:(NSString *)name gender:(KSCreatureGenderType)gender {
    return [[[self alloc] initWithName:name gender:gender] autorelease];
}

+ (NSMutableDictionary *)genderClasses {
    return __genderClasses;
}

+ (void)registerCreatureClass:(Class)objectClass forGender:(KSCreatureGenderType)gender {
    NSAssert(nil == objectClass || [objectClass conformsToProtocol:@protocol(KSCreatureProtocol)],
             @"creature class must conform KSCreatureProtocol");
    if (objectClass) {
        NSMutableDictionary *genderClass = [self genderClasses];
        genderClass[@(gender)] = objectClass;
    }
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
        self.mutableKids = [NSMutableSet set];
    }
    
    return self;
}

//+(Class)classForGender:(KSCreatureGenderType)gender {
//    NSMutableDictionary *genderClasses = [self genderClasses];
//    Class result = genderClasses[@(gender)];
//    
//    switch (gender) {
//        case kKSCreatureGenderMale:
//            result = [KSMan class];
//            break;
//        case kKSCreatureGenderFemale:
//            result = [KSWoman class];
//        default:
//            break;
//    }
//    return result;
//}

- (instancetype)initWithName:(NSString *)name gender:(KSCreatureGenderType)gender {
    Class objectClass = [[self class] registerCreatureClass:gender];
    
    assert(Nil != objectClass);
    [self release];
    
    self = [[objectClass alloc] init];    
    if (self) {
        self.mutableKids = [NSMutableSet set];
        self.name = name;
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

- (void)addKid:(id <KSCreatureProtocol>) kid {
    if ([kid conformsToProtocol:@protocol(KSCreatureProtocol)]) {
        [self.mutableKids addObject:kid];
    }
    
}

- (void)removeKid:(id <KSCreatureProtocol>) kid {
    [self.mutableKids removeObject:kid];
}

#pragma mark-
#pragma mark KSCreatureProtocol

-(id)performGenderSpecificOperation {
    return nil;
}

@end
