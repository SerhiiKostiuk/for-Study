
//
//  main.c
//  LerningCPart1
//
//  Created by Serg Bla on 16.09.15.
//  Copyright (c) 2015 Serg Bla. All rights reserved.
//

#include <stdio.h>

#include "KSDataTypesTests.h"
#include "KSCheckValueAndPrintTests.h"
#include "KSPrimitiveTypeTests.h"
#include "KSTypeRepresentationInBinary.h"
#include "KSTypeRepresentationInBinaryTests.h"
#include "KSStructureTests.h"
#include "KSHumanTests.h"

#define executeTest(testName) printf (#testName " started...\n");\
printf("\n");\
testName();\
printf(#testName " finished\n");\
printf("\n");

int main(int argc, const char * argv[]) {
    
    executeTest(KSPrintSizeOfDataTypes);
    
    executeTest(KSFulfillCheckingOfTheParentTypeTests);
    
    executeTest(KSPrimitiveTypeTests);
    
    executeTest(KSStructureTests);

    executeTest(KSTypeRepresentationInBinaryTests);
    
    executeTest(KSHumanExecuteTests);

    
 
    
 
    return 0;
}
