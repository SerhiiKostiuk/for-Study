//
//  objectStructureHuman.h
//  LerningCPart1
//
//  Created by Serg Bla on 02.10.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#ifndef objectStructureHuman_h
#define objectStructureHuman_h

#include <stdio.h>
#include <stdlib.h>
#include "KSString.h"
static
const uint8_t kKSKidsLimit = 4;

static
const uint8_t kKSPrimaryAge = 1;

typedef enum {
    kKSHumanGenderUndefiened,
    kKSHumanGenderMale,
    kKSHumanGenderFemale
} KSHumanGenderType;

typedef struct KSHuman KSHuman;

struct KSHuman { 
    KSObject _super;
    KSString *_name;
    KSHuman *_partner;
    KSHuman *_mother;
    KSHuman *_father;
    KSHuman *_kids[kKSKidsLimit];
    uint8_t _kidsCount;
    uint8_t _age;
    KSHumanGenderType _gender;
};

extern
KSHuman *KSHumanCreate(void);

extern
KSHuman *KSHumanCreateWithParameters(KSHumanGenderType gender, KSString *name, uint8_t age);

extern
KSHuman *KSHumanCreateKidWithParameters(KSHumanGenderType gender, KSHuman *mother, KSHuman *father, KSString *name);

extern
void __KSHumanDeallocate(void *object);

extern
void KSHumanRelease(KSHuman *object);

extern
KSString *KSHumanName(KSHuman *object);

extern
void KSHumanSetName(KSHuman *object, KSString *name);

extern
KSHuman *KSHumanPartner(KSHuman *object);

extern
KSHuman *KSHumanMother(KSHuman *object);

extern
KSHuman *KSHumanFather(KSHuman *object);

extern
KSHuman *KSHumanKids(KSHuman *object);

extern
uint8_t KSHumanKidsCount(KSHuman *object);

extern
uint8_t KSHumanAge(KSHuman *object);

extern
void KSHumanSetAge(KSHuman *object, uint8_t age);

extern
KSHumanGenderType KSHumanGender(KSHuman *object);

extern
void KSHumanSetMarry(KSHuman *object, KSHuman *partner);

extern
void KSHumanSetDivorce(KSHuman *object);

extern
void KSHumanRemoveKid(KSHuman *parent, KSHuman *kid);

#endif /* objectStructureHuman_h */
