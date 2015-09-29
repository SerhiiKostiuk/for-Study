//
//  KSStructureTests.c
//  LerningCPart1
//
//  Created by Serg Bla on 28.09.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//
#include <stdlib.h>
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
    
    printf("The weight of structure 1 = %lu\n",sizeof(TheFirstStructure));
    printf("The weight of structure 2 = %lu\n",sizeof(TheSecondStructure));
    printf("The weight of structure 3 = %lu\n\n",sizeof(TheThirdStructure));
}

void KSStructureOffsetofTests(void){
   
    KSOutputFunctionForTheFirstStructureOffsetofTests(variableInt);
    KSOutputFunctionForTheFirstStructureOffsetofTests(variableLongLong);
    KSOutputFunctionForTheFirstStructureOffsetofTests(variableBool2);
    KSOutputFunctionForTheFirstStructureOffsetofTests(variableFloat);
    KSOutputFunctionForTheFirstStructureOffsetofTests(variableShort1);
    KSOutputFunctionForTheFirstStructureOffsetofTests(variableBool1);
    KSOutputFunctionForTheFirstStructureOffsetofTests(variableDouble);
    KSOutputFunctionForTheFirstStructureOffsetofTests(variableBool3);
    KSOutputFunctionForTheFirstStructureOffsetofTests(variableShort2);
    KSOutputFunctionForTheFirstStructureOffsetofTests(variableStringPointer);
    KSOutputFunctionForTheFirstStructureOffsetofTests(variableBool4);
    KSOutputFunctionForTheFirstStructureOffsetofTests(variableShort3);
    KSOutputFunctionForTheFirstStructureOffsetofTests(variableBool5);
    KSOutputFunctionForTheFirstStructureOffsetofTests(variableBool6);
    
    KSMember_size(TheThirdStructure, variableLongLong);
    KSOffsetofFunction(TheSecondStructure, variableShort1);
   // printf("%lu\n",member_size(TheThirdStructure, boolFlags));
   // KSOutputFunctionForTheThirdStructureOffsetofTests(variableBool3);

}
