//
//  KSCreatureTests.m
//  LearningDevelop
//
//  Created by Serg Bla on 22.11.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import "KSMan.h"
#import "KSWoman.h"
#import "KSCreature.h"
#import "KSCreatureTests.h"

@implementation KSCreatureTests

#pragma mark -
#pragma mark Public Implementations

+ (void)KSCreatureBehaviourTests {
    [KSCreatureTests KSCreatureAddKidTests];
}

#pragma mark -
#pragma mark Private Implementations

+ (void)KSCreatureAddKidTests {
    // Create creature with name and male gender
    id creature = [KSCreature creatureWithName:@"James" gender:kKSCreatureGenderMale];
    
        //after creature was created:
            // creature must not be nil
            assert(nil != creature);
    
            // creature must be KSMan class
            assert([KSMan class] == [creature class]);
    
            // creature gender must be male
            assert(kKSCreatureGenderMale == [creature gender]);
    
            // creature property kids must be initialized
            assert([creature kids]);
    
            // don't have any kids
            assert(0 == [[creature kids]count]);
    
    // Create firstKid with name and female gender
    id firstKid = [KSCreature creatureWithName:@"Julia" gender:kKSCreatureGenderFemale];
    
        //after firstKid was created:
            // firstKid must not be nil
            assert(nil != firstKid);
    
            // firstKid must be KSWoman class
            assert([KSWoman class] == [firstKid class]);
    
            // firstKid gender must be female
            assert(kKSCreatureGenderFemale == [firstKid gender]);
    
            // firstKid property kids must be initialized
            assert([firstKid kids]);
    
            // don't have any kids
            assert(0 == [[firstKid kids]count]);
    
    // Add firstKid to creature kids
     [creature addKid:firstKid];
    
    // creature count must be 1
     assert(1 == [[creature kids]count]);
    
    // creature kids set must contain firstKid
    assert([[creature kids] containsObject:firstKid]);
    
    // Create secondKid with name and male gender
    id secondKid = [KSCreature creatureWithName:@"Mark" gender:kKSCreatureGenderMale];
    
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
    id firstGrandKid = [KSCreature creatureWithName:@"Elon" gender:kKSCreatureGenderMale];
   
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
    
    [creature performGenderSpecificOperation];
    [firstKid performGenderSpecificOperation];
}
@end
