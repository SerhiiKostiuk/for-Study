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

static
const uint8_t kKSKidsLimit =20;

typedef enum {
    KSHumanGenderUndefiened,
    KSHumanGenderMale,
    KSHumanGenderFemale
} KSHumanGenderType;

typedef struct KSHuman KSHuman;

struct KSHuman {
    uint64_t _referenceCount;
    char *_name;
    KSHuman *_partner;
    KSHuman *_mother;
    KSHuman *_father;
    KSHuman *_kids[kKSKidsLimit];
    uint8_t _kidsCount;
    uint8_t _age;
    KSHumanGenderType _gender;
};



KSHuman *KSHumanCreate(void);
KSHuman *KSHumanCreateByDefault(KSHumanGenderType gender, char *name, uint8_t age);
void _KSHumanDeallocate(KSHuman *object);

char *KSHumanName (KSHuman *object);
void KSHumanSetName (KSHuman *object, char *_name);

KSHuman *KSHumanPartner (KSHuman *object);
void KSHumanSetPartner (KSHuman *object, KSHuman *partner);

KSHuman *KSHumanMother (KSHuman *object);
void KSHumanSetMother (KSHuman *object, KSHuman *mother);

KSHuman *KSHumanFather (KSHuman *object);
void KSHumanSetFather (KSHuman *object, KSHuman *father);

KSHuman *KSHumanKids (KSHuman *object);
void KSHumanSetKids (KSHuman *object, KSHuman *kids);

uint8_t KSHumanKidsCount (KSHuman *object);
void KSHumanSetKidsCount (KSHuman *object, uint8_t kidsCount);

uint8_t KSHumanAge (KSHuman *object);
void KSHumanSetAge (KSHuman *object, uint8_t age);

KSHumanGenderType KSHumanGender (KSHuman *object);
void KSHumanSetGender (KSHuman *object, KSHumanGenderType gender);

//bool KSHumanIsMarried (KSHuman *object);

void KSHumanSetMarry (KSHuman *object, KSHuman *partner);

void KSHumanSetDivorce (KSHuman *object, KSHuman *partner);



#endif /* objectStructureHuman_h */
