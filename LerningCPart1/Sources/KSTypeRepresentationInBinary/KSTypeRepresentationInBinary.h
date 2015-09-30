//
//  KSTypeRepresentationInBinary.h
//  LerningCPart1
//
//  Created by Serg Bla on 25.09.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#ifndef KSTypeRepresentationInBinary_h
#define KSTypeRepresentationInBinary_h

typedef enum{
    KSLittleEndian = 0,
    KsBigEndian = 1,
} KSTypeOfEndian;

typedef union {
    uint16_t data;

    struct {
        uint8_t isLittleEndian;
        uint8_t isBigEndian;
    };
} kEndianTypeRecognizer;

void KSOutputDataFieldOfSize(void *data, size_t size, KSTypeOfEndian endianType);
#endif /* KSTypeRepresentationInBinary_h */
