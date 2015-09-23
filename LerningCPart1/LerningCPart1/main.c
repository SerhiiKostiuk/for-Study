//
//  main.c
//  LerningCPart1
//
//  Created by Serg Bla on 16.09.15.
//  Copyright (c) 2015 Serg Bla. All rights reserved.
//

#include <stdio.h>
#include "KSCheckValueAndPrint.h"
#include "KSDataTypesTests.h"
#include "KSCheckValueAndPrintTests.h"
#include "KSPrimitiveTypeTests.h"
int main(int argc, const char * argv[]) {
    
    KSPrintSizeOfDataTypes();
    
    KSFulfillCheckingOfTheParentTypeTests();
    
    KSPrimitiveTypeTests();

    return 0;
}
