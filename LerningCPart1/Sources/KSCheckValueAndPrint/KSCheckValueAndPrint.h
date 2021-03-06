//
//  KSCheckValueAndPrint.h
//  LerningCPart1
//
//  Created by Serg Bla on 16.09.15.
//  Copyright (c) 2015 Serg Bla. All rights reserved.
//

#ifndef __LerningCPart1__KSCheckValueAndPrint__
#define __LerningCPart1__KSCheckValueAndPrint__

#include <stdio.h>

typedef enum {
    kKSParentTypeUndefined = 0,
    kKSParentTypeMama,
    kKSParentTypePapa,
    kKSParentTypeMamaPapa
} KSParentType;

extern KSParentType KSCheckValueAndPrint(int value);

#endif /* defined(__LerningCPart1__KSCheckValueAndPrint__) */
