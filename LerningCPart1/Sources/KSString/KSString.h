//
//  KSString.h
//  LerningCPart1
//
//  Created by Serg Bla on 25.10.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#ifndef KSString_h
#define KSString_h

#include "KSObject.h"
#include <stdio.h>

typedef struct {
    KSObject _super;
    char *_value;
} KSString;

extern
KSString *KSStringCreateWithString(char *value);

extern
void __KSStringDeallocate(KSString *object);

extern
char *KSStringValue(KSString *object);

extern
void KSStringSetValue(KSString *object, char *value);

extern
size_t KSStringLength(KSString *object);

#endif /* KSString_h */
