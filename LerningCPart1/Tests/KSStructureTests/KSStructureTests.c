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
    
    KSOutputFunctionForTheStructureSizeofTests(TheFirstStructure);
    KSOutputFunctionForTheStructureSizeofTests(TheSecondStructure);
    KSOutputFunctionForTheStructureSizeofTests(TheThirdStructure);
    KSMemberSize(TheThirdStructure, boolFlags);

}

void KSStructureOffsetofTests(void){
   
    KSOutputFunctionForTheStructureOffsetofTests(TheFirstStructure, variableInt);
    KSOutputFunctionForTheStructureOffsetofTests(TheFirstStructure, variableLongLong);
    KSOutputFunctionForTheStructureOffsetofTests(TheFirstStructure, variableBool2);
    KSOutputFunctionForTheStructureOffsetofTests(TheFirstStructure, variableFloat);
    KSOutputFunctionForTheStructureOffsetofTests(TheFirstStructure, variableShort1);
    KSOutputFunctionForTheStructureOffsetofTests(TheFirstStructure, variableBool1);
    KSOutputFunctionForTheStructureOffsetofTests(TheFirstStructure, variableDouble);
    KSOutputFunctionForTheStructureOffsetofTests(TheFirstStructure, variableBool3);
    KSOutputFunctionForTheStructureOffsetofTests(TheFirstStructure, variableShort2);
    KSOutputFunctionForTheStructureOffsetofTests(TheFirstStructure, variableStringPointer);
    KSOutputFunctionForTheStructureOffsetofTests(TheFirstStructure, variableBool4);
    KSOutputFunctionForTheStructureOffsetofTests(TheFirstStructure, variableShort3);
    KSOutputFunctionForTheStructureOffsetofTests(TheFirstStructure, variableBool5);
    KSOutputFunctionForTheStructureOffsetofTests(TheFirstStructure, variableBool6);
   
}
