//
//  KSCreatureProtocol.h
//  LearningDevelop
//
//  Created by Serg Bla on 24.11.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import "KSCreature.h"

typedef NS_ENUM (NSUInteger, KSCreatureGenderType) {
    kKSCreatureGenderUndefined,
    kKSCreatureGenderMale,
    kKSCreatureGenderFemale
};

@protocol KSCreatureProtocol <NSObject>
@required

@property (nonatomic, readonly, copy) NSString              *name;
@property (nonatomic, readonly)       NSSet                 *kids;
@property (nonatomic, readonly)       KSCreatureGenderType  gender;

@property (nonatomic, assign)         uint8_t    age;
@property (nonatomic, assign)         uint8_t    weight;

-(id)performGenderSpecificOperation;

@optional
- (void)sayHi;
- (void)goFight;
//- (id)goReproduce;

@end
