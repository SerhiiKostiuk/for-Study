//
//  KSCreature.h
//  LearningDevelop
//
//  Created by Serg Bla on 21.11.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KSCreatureProtocol.h"


@interface KSCreature : NSObject <KSCreatureProtocol>

+ (instancetype)creatureWithName:(NSString *)name gender:(KSCreatureGenderType)gender;

- (instancetype)initWithName:(NSString *)name gender:(KSCreatureGenderType)gender;

- (void)addKid:(id) kid;
- (void)removeKid:(id) kid;

@end
