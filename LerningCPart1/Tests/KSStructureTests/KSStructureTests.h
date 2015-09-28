//
//  KSStructureTests.h
//  LerningCPart1
//
//  Created by Serg Bla on 28.09.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#ifndef KSStructureTests_h
#define KSStructureTests_h

#include <stdio.h>

#define KSOutputFunctionForOffsetofTests(nameOfElement, locationOfElement) \
printf(""#nameOfElement" = %lu\n", offsetof(TheFirstStructure,#nameOfElement))

extern
void KSStructureTests(void);



#endif /* KSStructureTests_h */
