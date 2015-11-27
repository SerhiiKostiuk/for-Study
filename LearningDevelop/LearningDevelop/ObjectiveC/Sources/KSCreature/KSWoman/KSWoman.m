//
//  KSWoman.m
//  LearningDevelop
//
//  Created by Serg Bla on 24.11.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import "KSWoman.h"
#import "KSCreature.h"
#import "KSCreatureProtocol.h"

@interface KSWoman ()

-(id)goReproduce;

@end

@implementation KSWoman 

-(KSCreatureGenderType)gender {
    return kKSCreatureGenderFemale;
}

#pragma mark-
#pragma mark KSCreatureProtocol

- (id)goReproduce {
    id object = [KSCreature creatureWithName:nil gender:arc4random_uniform(2)];
    [self addKid:object];
    
    return nil;
}

-(id)performGenderSpecificOperation {
    return [self goReproduce];
    
}

@end
