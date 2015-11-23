//
//  KSCreatureTests.m
//  LearningDevelop
//
//  Created by Serg Bla on 22.11.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import "KSCreature.h"
#import "KSCreatureTests.h"

@implementation KSCreatureTests

+ (void)KSCreatureBehaviourTests {
    [KSCreatureTests KSCreatureAddKidTests];
}


+ (void)KSCreatureAddKidTests {
    // Create creature with name and male gender
    KSCreature *creature = [KSCreature creatureWithName:@"James" gender:kKSCreatureGenderMale];
    
        //after creature was created:
            // creature must not be nil
            assert(nil != creature);
    
            // don't have any kids
            assert(0 == [[creature kids]count]);
    
    // Create firstKid with name and female gender
    KSCreature *firstKid = [KSCreature creatureWithName:@"Julia" gender:kKSCreatureGenderFemale];
    
        //after firstKid was created:
            // firstKid must not be nil
            assert(nil != firstKid);
    
            // don't have any kids
            assert(0 == [[firstKid kids]count]);
    
    // Add firstKid to creature kids
     [creature addKid:firstKid];
    
    // creature count must be 1
     assert(1 == [[creature kids]count]);
    
    // Create secondKid with name and male gender
    KSCreature *secondKid = [KSCreature creatureWithName:@"Mark" gender:kKSCreatureGenderMale];
    
        //after firstKid was created:
            // firstKid must not be nil
            assert(nil != secondKid);
    
            // don't have any kids
            assert(0 == [[secondKid kids]count]);
    
     // Add secondKid to creature kids
      [creature addKid:secondKid];
    
    // creature count must be 2
     assert(2 == [[creature kids] count]);
    
    // Create firstGrandKid with name and male gender
    KSCreature *firstGrandKid = [KSCreature creatureWithName:@"Elon" gender:kKSCreatureGenderMale];
   
        //after firstKid was created:
            // firstKid must not be nil
            assert(nil != firstKid);
    
            // don't have any kids
            assert(0 == [[firstGrandKid kids]count]);
    
    // Add firstGrandKid to firstKid kids
    [firstKid addKid:firstGrandKid];
    
    // firstKid count must be 1
    assert(1 == [[firstKid kids]count]);
    
    // all creatures must say Hi
    [creature sayHi];
}
@end
