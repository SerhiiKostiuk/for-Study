//
//  KSTypeRepresentationInBinary.h
//  LerningCPart1
//
//  Created by Serg Bla on 25.09.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#ifndef KSTypeRepresentationInBinary_h
#define KSTypeRepresentationInBinary_h

#include <stdio.h>

typedef enum{
    kKSLittleEndian = 0,
    kKSBigEndian = 1,
} KSTypeOfEndian;

extern
void KSOutputDataFieldOfSize(void *data, size_t size, KSTypeOfEndian endianType);
#endif /* KSTypeRepresentationInBinary_h */
