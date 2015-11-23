//
//  KSCreature.h
//  LearningDevelop
//
//  Created by Serg Bla on 21.11.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM (NSUInteger, KSCreatureGenderType) {
    kKSCreatureGenderUndefiened,
    kKSCreatureGenderMale,
    kKSCreatureGenderFemale
};

@interface KSCreature : NSObject

@property (nonatomic, readonly, copy) NSString        *name;
@property (nonatomic, readonly)       NSSet           *kids;
@property (nonatomic, readonly) KSCreatureGenderType  gender;

@property (nonatomic, assign) uint8_t    age;
@property (nonatomic, assign) uint8_t    weight;

+ (KSCreature *)creature;
+ (KSCreature *)creatureWithName:(NSString *)name gender:(KSCreatureGenderType)gender;

- (instancetype)initWithName:(NSString *)name gender:(KSCreatureGenderType)gender;

- (void)sayHi;

- (void)goFight;
- (void)goReproduce;

- (void)addKid:(KSCreature *) kid;
- (void)removeKid:(KSCreature *) kid;


@end
