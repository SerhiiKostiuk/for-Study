//
//  KSObjectStructureHumanTests.c
//  LerningCPart1
//
//  Created by Serg Bla on 02.10.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//
#include <assert.h>

#include "KSObjectStructureHumanTests.h"
#include "KSObjectStructureHuman.h"

void KSHumanTests(void){
    
    char *name = "Vasia";
// After person object was created
    KSHuman *person = KSHumanCreate();

    KSHumanSetName(person, name);
    printf("Human name is %s\n", person->_name);
    printf("Human age is %d\n", person->_age);
//      object must not be NULL
    if (NULL == person) {
        printf("Person is NULL");
    }
//      object must not be married
//      object must not have partner
    if (NULL == person->_partner) {
        printf("Person is not married and don't have partner\n");
    }
//      object children count must be 0
    printf("Kids Count is :%d\n",person->_kidsCount);
//      after person gender was set to male
//            object must have male gender
 //   KSHumanSetGender(person, KSHumanGenderMale);
    printf("Person gender is %d\n\n",person->_gender);
    
    
    char *femaleName = "Masha";
    // After female was created
    KSHuman *woman = KSHumanCreateWithParameters(kKSHumanGenderFemale, femaleName, 23);
    
    assert(femaleName != KSHumanName(woman));
    printf("Woman name is %s\n", KSHumanName(woman));
    printf("Woman age is %d\n", KSHumanAge(woman));
    //      female must not be NULL
    if (NULL == woman) {
        printf("Woman is NULL ");
    }
    //      female must not be married
    //      female must not have partner
    if (NULL == KSHumanPartner(woman)) {
        printf("Woman is not married and don't have partner\n");
    }
    //      female children count must be 0
    printf("Kids Count is :%d\n",woman->_kidsCount);
    //      after person gender was set to male
    //            female must have male gender
 //   KSHumanSetGender(woman, KSHumanGenderFemale);
    printf("Woman gender is %d\n",woman->_gender);
    
// After person was married with female
//       person and female must have partners
    KSHumanSetMarry(person, woman);
 

    
    char *kidName = "Petya";
    char *kid1Name = "Tania";
    
    KSHuman *kid = KSHumanCreateKidWithParameters(kKSHumanGenderMale, woman, person, kidName);
    KSHuman *kid1 = KSHumanCreateKidWithParameters(kKSHumanGenderFemale, woman, person, kid1Name);
    KSHuman *kid2 = KSHumanCreateKidWithParameters(kKSHumanGenderMale, woman, person, name);
    
    printf("Child mother %p\n",kid->_mother);
    printf("%d\n", KSHumanKidsCount(woman));
    
   
    KSObjectRelease(kid);
    KSObjectRelease(kid1);
    KSObjectRelease(kid2);
    KSObjectRelease(person);
    KSHumanSetDivorce(woman);
    KSHumanSetDivorce(person);
    
    printf("%d\n", KSHumanKidsCount(woman));
    

    KSObjectRelease(woman);
    
    

    
    
}
