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

void KSStructureTests(void) {
    KSStructureSizeofTests();
    KSStructureOffsetofTests();
}

#pragma mark -
#pragma mark Private Implementations

void KSStructureSizeofTests(void) {
    
    KSOutputFunctionForTheStructureSizeofTests(KSRandomStructure);
    KSOutputFunctionForTheStructureSizeofTests(KSCompactStructure);
    KSOutputFunctionForTheStructureSizeofTests(KSStructureWithUnion);
    KSMemberSize(KSStructureWithUnion, boolFlags);

}

void KSStructureOffsetofTests(void) {
    
    printf("OffSetof Tests of KSRandomStructure \n\n");
    KSOutputFunctionForTheStructureOffsetofTests(KSRandomStructure, variableInt);
    KSOutputFunctionForTheStructureOffsetofTests(KSRandomStructure, variableLongLong);
    KSOutputFunctionForTheStructureOffsetofTests(KSRandomStructure, variableBool2);
    KSOutputFunctionForTheStructureOffsetofTests(KSRandomStructure, variableFloat);
    KSOutputFunctionForTheStructureOffsetofTests(KSRandomStructure, variableShort1);
    KSOutputFunctionForTheStructureOffsetofTests(KSRandomStructure, variableBool1);
    KSOutputFunctionForTheStructureOffsetofTests(KSRandomStructure, variableDouble);
    KSOutputFunctionForTheStructureOffsetofTests(KSRandomStructure, variableBool3);
    KSOutputFunctionForTheStructureOffsetofTests(KSRandomStructure, variableShort2);
    KSOutputFunctionForTheStructureOffsetofTests(KSRandomStructure, variableStringPointer);
    KSOutputFunctionForTheStructureOffsetofTests(KSRandomStructure, variableBool4);
    KSOutputFunctionForTheStructureOffsetofTests(KSRandomStructure, variableShort3);
    KSOutputFunctionForTheStructureOffsetofTests(KSRandomStructure, variableBool5);
    KSOutputFunctionForTheStructureOffsetofTests(KSRandomStructure, variableBool6);
    printf("OffSetof Tests of KSCompactStructure \n\n");
    KSOutputFunctionForTheStructureOffsetofTests(KSCompactStructure, variableStringPointer);
    KSOutputFunctionForTheStructureOffsetofTests(KSCompactStructure, variableLongLong);
    KSOutputFunctionForTheStructureOffsetofTests(KSCompactStructure, variableDouble);
    KSOutputFunctionForTheStructureOffsetofTests(KSCompactStructure, variableFloat);
    KSOutputFunctionForTheStructureOffsetofTests(KSCompactStructure, variableInt);
    KSOutputFunctionForTheStructureOffsetofTests(KSCompactStructure, variableShort1);
    KSOutputFunctionForTheStructureOffsetofTests(KSCompactStructure, variableShort2);
    KSOutputFunctionForTheStructureOffsetofTests(KSCompactStructure, variableShort3);
    KSOutputFunctionForTheStructureOffsetofTests(KSCompactStructure, variableBool1);
    KSOutputFunctionForTheStructureOffsetofTests(KSCompactStructure, variableBool2);
    KSOutputFunctionForTheStructureOffsetofTests(KSCompactStructure, variableBool3);
    KSOutputFunctionForTheStructureOffsetofTests(KSCompactStructure, variableBool4);
    KSOutputFunctionForTheStructureOffsetofTests(KSCompactStructure, variableBool5);
    KSOutputFunctionForTheStructureOffsetofTests(KSCompactStructure, variableBool6);
    printf("OffSetof Tests of KSStructureWithUnion \n\n");
    KSOutputFunctionForTheStructureOffsetofTests(KSStructureWithUnion, variableStringPointer);
    KSOutputFunctionForTheStructureOffsetofTests(KSStructureWithUnion, variableLongLong);
    KSOutputFunctionForTheStructureOffsetofTests(KSStructureWithUnion, variableDouble);
    KSOutputFunctionForTheStructureOffsetofTests(KSStructureWithUnion, variableFloat);
    KSOutputFunctionForTheStructureOffsetofTests(KSStructureWithUnion, variableInt);
    KSOutputFunctionForTheStructureOffsetofTests(KSStructureWithUnion, variableShort1);
    KSOutputFunctionForTheStructureOffsetofTests(KSStructureWithUnion, variableShort2);
    KSOutputFunctionForTheStructureOffsetofTests(KSStructureWithUnion, variableShort3);
    KSOutputFunctionForTheStructureOffsetofTests(KSStructureWithUnion, boolFlags);
    
}
