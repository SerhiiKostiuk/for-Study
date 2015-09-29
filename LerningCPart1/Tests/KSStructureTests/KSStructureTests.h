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

#define KSOutputFunctionForTheFirstStructureOffsetofTests(nameOfElement) \
printf(""#nameOfElement" = %lu\n\n",offsetof(TheFirstStructure,nameOfElement))

//#define KSOutputFunctionForTheThirdStructureOffsetofTests(nameOfElement) \
//printf("v = %lu\n",offsetof(TheThirdStructure,nameOfElement))

#define KSMember_size(type, member) printf(""#member" has = %lu bytes \n",sizeof(((type ){0}).member))
#define KSOffsetofFunction(type, member) printf(""#member" has = %lu \n",((size_t) &((type *)0)->member))

extern
void KSStructureTests(void);



#endif /* KSStructureTests_h */
