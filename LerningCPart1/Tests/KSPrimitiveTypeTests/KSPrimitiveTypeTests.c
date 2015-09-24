//
//  KSPrimitiveTypeTests.c
//  LerningCPart1
//
//  Created by Serg Bla on 23.09.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#include "KSPrimitiveTypeTests.h"

#pragma mark -
#pragma mark Private Declarations

KSMacrosThatGeneratingValueOfPrimitiveType(int);
KSMacrosThatGeneratingValueOfPrimitiveType(char);
KSMacrosThatGeneratingValueOfPrimitiveType(float);

#pragma mark -
#pragma mark Public Implementations

void KSPrimitiveTypeTests(){
    KSCauseDataValueForPrinting(int, 21);
    KSCauseDataValueForPrinting(char, 'j');
    KSCauseDataValueForPrinting(float, 3.14);
}

#pragma mark -
#pragma mark Private Implementations

KSDataValueForPrinting(int,%d);
KSDataValueForPrinting(char,%c);
KSDataValueForPrinting(float,%.3f);


