//
//  KSStructureTests.c
//  LerningCPart1
//
//  Created by Serg Bla on 28.09.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//
#include <stddef.h>
#include "KSStructureTests.h"
#include "KSStructure.h"

#pragma mark -
#pragma mark Private Declarations

static
void KSStructureSizeofTests(void);

static
void KSStructureOffsetofTests(void);


#pragma mark -
#pragma mark Public Implementations

void KSStructureTests(void){
    KSStructureSizeofTests();
    KSStructureOffsetofTests();
}

#pragma mark -
#pragma mark Private Implementations

void KSStructureSizeofTests(void){
    TheFirstStructure structure1;
    printf("The weight of structure 1 = %lu\n",sizeof(structure1));
}

void KSStructureOffsetofTests(void){
  //  KSOutputFunctionForOffsetofTests(variableBool1,variableBool1);
}
