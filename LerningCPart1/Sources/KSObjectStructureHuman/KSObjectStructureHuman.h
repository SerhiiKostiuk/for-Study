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
    KSHumanGenderMale,
    KSHumanGenderFemale
} _KSHumanGender;

typedef  struct  {
    char *_name;
    char *_pointerOnPartner;
    char *_pointerOnMother;
    char *_pointerOnFather;
    char *_kids[20];
    int _kidsCount;
    uint8_t _age;
    char _KSHumanGender;
    bool _isMarried;
} KSHuman;


KSHuman *KSHumanCreate(void);
void _KSHumanDeallocate(KSHuman *KSObject);

char *KSHumanName (KSHuman *KSObject);
void KSHumanSetName (KSHuman *KSObject, char *_name);

char *KSHumanPointerOnPartner (KSHuman *KSObject);
void KSHumanSetPointerOnPartner (KSHuman *KSObject, char *_pointerOnPartner);

char *KSHumanPointerOnMother (KSHuman *KSObject);
void KSHumanSetPointerOnMother (KSHuman *KSObject, char *_pointerOnMother);

char *KSHumanPointerOnFather (KSHuman *KSObject);
void KSSetPointerOnFather (KSHuman *KSObject, char *_pointerOnFather);



uint8_t KSHumanAge (KSHuman *KSObject);
void KSHumanSetAge (KSHuman *KSObject, uint8_t _age);

char KSHumanGender (KSHuman *KSObject);
void KSHumanSetGender (KSHuman *KSObject, char _KSHumanGender);

bool KSHumanIsMarried (KSHuman *KSObject);
void KSHumanSetMarried (KSHuman *KSObject, bool _isMarried);

int KSHumanKids (KSHuman *KSObject);
//void KSObjectStructureHumanSetKids (KSHuman *KSObject, int kids);//ненужно



#endif /* KSObjectStructureHuman_h */
