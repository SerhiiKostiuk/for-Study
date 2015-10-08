//
//  KSObjectStructureHuman.h
//  LerningCPart1
//
//  Created by Serg Bla on 02.10.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#ifndef KSObjectStructureHuman_h
#define KSObjectStructureHuman_h

#include <stdio.h>


typedef enum {
    KSHumanGenderUndefiened,
    KSHumanGenderMale,
    KSHumanGenderFemale
} KSHumanGenderType;

typedef struct KSHuman KSHuman;



KSHuman *KSHumanCreate(void);
void _KSHumanDeallocate(KSHuman *KSObject);

char *KSHumanName (KSHuman *KSObject);
void KSHumanSetName (KSHuman *KSObject, char *_name);

KSHuman *KSHumanPartner (KSHuman *KSObject);
void KSHumanSetPartner (KSHuman *KSObject, KSHuman *_partner);

KSHuman *KSHumanMother (KSHuman *KSObject);
void KSHumanSetMother (KSHuman *KSObject, KSHuman *_mother);

KSHuman *KSHumanFather (KSHuman *KSObject);
void KSHumanSetFather (KSHuman *KSObject, KSHuman *_father);

KSHuman *KSHumanKids (KSHuman *KSObject);
void KSHumanSetKids (KSHuman *KSObject, KSHuman *_kids);

uint8_t KSHumanKidsCount (KSHuman *KSObject);
void KSHumanSetKidsCount (KSHuman *KSObject, uint8_t _kidsCount);

uint8_t KSHumanAge (KSHuman *KSObject);
void KSHumanSetAge (KSHuman *KSObject, uint8_t _age);

KSHumanGenderType KSHumanGender (KSHuman *KSObject);
void KSHumanSetGender (KSHuman *KSObject, KSHumanGenderType gender);

bool KSHumanIsMarried (KSHuman *KSObject);

void KSHumanSetMarry (KSHuman *KSObject, KSHuman *_partner);

void KSHumanSetDivorce (KSHuman *KSObject, KSHuman *_partner);



#endif /* KSObjectStructureHuman_h */
