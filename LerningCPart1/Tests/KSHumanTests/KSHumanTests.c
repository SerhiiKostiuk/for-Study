
//
//  KSObjectStructureHumanTests.c
//  LerningCPart1
//
//  Created by Serg Bla on 02.10.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//
#include <assert.h>

#include "KSMacros.h"
#include "KSHumanTests.h"
#include "KSHuman.h"
#include "KSObject.h"

#pragma mark -
#pragma mark Private Declarations

static
void KSHumanCreatingTests(void);

static
void KSHumanMariedTests(void);

#pragma mark -
#pragma mark Public Implementations

void KSHumanExecuteTests(void){
     KSHumanCreatingTests();
     KSHumanMariedTests();
}

#pragma mark -
#pragma mark Private Implementations

void KSHumanCreatingTests(void){
    KSString *maleName = KSStringCreate("Vasia");
    
// Create Human object with male gender and other parameters
    KSHuman *male = KSHumanCreateWithParameters(kKSHumanGenderMale, maleName, 23);
  // After Human male was created:
    // Male must not be NULL
    assert(NULL != male);
    
    // Male must not be Maried
    assert(NULL == KSHumanPartner(male));
    
    // Male must not have Mother
    assert(NULL == KSHumanMother(male));
    
    // Male must not have Father
    assert(NULL == KSHumanFather(male));
    
    // Male age must be equal to age in argument
    assert(23 == KSHumanAge(male));
    
    // Male retain count must be 1
    assert(1 == KSObjectRetainCount(male));
    
    KSObjectRelease(maleName);
    KSObjectRelease(male);
}

void KSHumanMariedTests(void){
    KSString *manName = KSStringCreate("Vasia");
    KSString *womanName = KSStringCreate("Masha");
    // Create Human object with male gender and other parameters
    KSHuman *man = KSHumanCreateWithParameters(kKSHumanGenderMale, manName, 23);
    // Create Human object with female gender and other parameters
    KSHuman *woman = KSHumanCreateWithParameters(kKSHumanGenderFemale, womanName, 21);
    
     // After object man  and object woman was created:
    
        // Man must not be NULL
        assert(NULL != man);
        // Woman must not be NULL
        assert(NULL != woman);
    
    // After Man and Woman was married
      KSHumanMarry(man, woman);
    
    // Object must have partner
    assert(NULL != KSHumanPartner(man));
    assert(NULL != KSHumanPartner(woman));





}
//    char *name = "Vasia";
//    KSString *nameOfPerson = KSStringCreate(name);
//// After person object was created
//    KSHuman *person = KSHumanCreate();
//
//    KSHumanSetName(person, nameOfPerson);
////    printf("Human name is %s\n", KSHumanName(person));
//    KSSringPrint(nameOfPerson);
//    printf("Human age is %d\n", person->_age);
////      object must not be NULL
//    if (NULL == person) {
//        printf("Person is NULL");
//    }
////      object must not be married
////      object must not have partner
//    if (NULL == person->_partner) {
//        printf("Person is not married and don't have partner\n");
//    }
////      object children count must be 0
//    printf("Kids Count is :%d\n",person->_kidsCount);
////      after person gender was set to male
////            object must have male gender
// //   KSHumanSetGender(person, KSHumanGenderMale);
//    printf("Person gender is %d\n\n",person->_gender);
//    
//    
//    char *femaleName = "Masha";
//     KSString *nameOfFemale = KSStringCreate(femaleName);
//    // After female was created
//    KSHuman *woman = KSHumanCreateWithParameters(kKSHumanGenderFemale, nameOfFemale, 23);
//    
////    assert(femaleName != KSHumanName(woman));
// //   printf("Woman name is %s\n", KSHumanName(woman));
//    printf("Woman age is %d\n", KSHumanAge(woman));
//    //      female must not be NULL
//    if (NULL == woman) {
//        printf("Woman is NULL ");
//    }
//    //      female must not be married
//    //      female must not have partner
//    if (NULL == KSHumanPartner(woman)) {
//        printf("Woman is not married and don't have partner\n");
//    }
//    //      female children count must be 0
//    printf("Kids Count is :%d\n",woman->_kidsCount);
//    //      after person gender was set to male
//    //            female must have male gender
// //   KSHumanSetGender(woman, KSHumanGenderFemale);
//    printf("Woman gender is %d\n",woman->_gender);
//    
//// After person was married with female
////       person and female must have partners
// 
//
//    
//  //  char *kidName = "Petya";
//     KSString *nameOfFirstKid = KSStringCreate("Petya");
//  //  char *kid1Name = "Tania";
//     KSString *nameOfSecondKid = KSStringCreate("Tania");
//    
//    KSHuman *kid = KSHumanCreateKidWithParameters(kKSHumanGenderMale, woman, person, nameOfFirstKid);
//    KSHuman *kid1 = KSHumanCreateKidWithParameters(kKSHumanGenderFemale, woman, person, nameOfSecondKid);
//    KSHuman *kid2 = KSHumanCreateKidWithParameters(kKSHumanGenderMale, woman, person, nameOfPerson);
//    printf("Child mother %p\n",kid->_mother);
//    printf("%d\n", KSHumanKidsCount(woman));
//    
//   
//    KSObjectRelease(kid);
//    KSObjectRelease(kid1);
//    KSObjectRelease(kid2);
//    KSHumanMarry(person, woman);
//
//    KSHumanDivorce(woman);
//    KSHumanDivorce(person);
//    KSHumanMarry(woman, person);
//   KSHumanRemoveKid(woman, kid1);
//   // KSObjectRelease(kid);
//
//    printf("%d\n", KSHumanKidsCount(woman));
//    KSObjectRelease(person);
//    KSObjectRelease(woman);
//    
//    
//    KSObject *object = KSObjectCreateOfType(KSObject);
//    
//    KSObjectRetain(object);
//    
//    KSObjectRelease(object);
//    
//    KSObjectRelease(object);
//    
//    assert(NULL != object);
//    

    
    

