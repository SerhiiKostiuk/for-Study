//
//  KSObjectStructureHuman.c
//  LerningCPart1
//
//  Created by Serg Bla on 02.10.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#include <stdbool.h>
#include "KSObjectStructureHuman.h"

#pragma mark -
#pragma mark Private Declarations
typedef  struct  {
    char *name;
    uint8_t age;
    char *sex;
    bool isMarried;
    int kids[20];
    char *pointerOnPartner;
    char *pointerOnParents;
} KSObjectStructureHuman;

#pragma mark -
#pragma mark Public Implementations

KSObjectStructureHuman *KSObjectStructureHumanCreate(void);
void _KSObjectStructureHumanDeallocate(KSObjectStructureHuman *KSHuman);

char *KSObjectStructureHumanName (KSObjectStructureHuman *KSHuman);
void KSObjectStructureHumanSetName (KSObjectStructureHuman *KSHuman, char *name);

uint8_t KSObjectStructureHumanAge (KSObjectStructureHuman *KSHuman);
void KSObjectStructureHumanSetAge (KSObjectStructureHuman *KSHuman, uint8_t age);

char *KSObjectStructureHumanSex (KSObjectStructureHuman *KSHuman);
void KSObjectStructureHumanSetSex (KSObjectStructureHuman *KSHuman, char *sex);

bool KSObjectStructureHumanIsMarried (KSObjectStructureHuman *KSHuman);
void KSObjectStructureHumanSetMarried (KSObjectStructureHuman *KSHuman, bool isMarried);

int KSObjectStructureHumanKids (KSObjectStructureHuman *KSHuman);
void KSObjectStructureHumanSetKids (KSObjectStructureHuman *KSHuman, int kids);

char KSObjectStructureHumanPointerOnPartner (KSObjectStructureHuman *KSHuman);
void KSObjectStructureHumanSetPointerOnPartner (KSObjectStructureHuman *KSHuman, char *pointerOnPartner);

char KSObjectStructureHumanPointerOnParents (KSObjectStructureHuman *KSHuman);
void KSObjectStructureHumanSetPointerOnParents (KSObjectStructureHuman *KSHuman, char *pointerOnParents);








