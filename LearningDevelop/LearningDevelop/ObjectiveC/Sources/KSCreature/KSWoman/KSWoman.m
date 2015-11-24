//
//  KSWoman.m
//  LearningDevelop
//
//  Created by Serg Bla on 24.11.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import "KSWoman.h"
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

-(id)performGenderSpecificOperation {
    return [self goReproduce];
}

- (id)goReproduce {
    return [KSCreature creature];
}
@end
