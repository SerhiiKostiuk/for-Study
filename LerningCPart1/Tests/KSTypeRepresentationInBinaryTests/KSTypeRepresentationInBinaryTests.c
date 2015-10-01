//
//  KSTypeRepresentationInBinaryTests.c
//  LerningCPart1
//
//  Created by Serg Bla on 30.09.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#include "KSTypeRepresentationInBinaryTests.h"
#include "KSTypeRepresentationInBinary.h"

#pragma mark -
#pragma mark Private Declarations

static
void KSPrintingBytesOfTheIntValue(void);

static
KSTypeOfEndian KSDetectOfTheEndianType(void);

#pragma mark -
#pragma mark Public Implementations

void KSTypeRepresentationInBinaryTests(void){
    
    KSPrintingBytesOfTheIntValue ();
}

#pragma mark -
#pragma mark Private Implementations

//Detecting of the endian type

KSTypeOfEndian KSDetectOfTheEndianType(void){
    KSTypeOfEndian endianType = 0;
    kEndianTypeRecognizer endianRecognizer;
    endianRecognizer.data = 1;
        if (1 == endianRecognizer.isLittleEndian) {
            endianType = KSLittleEndian;
        }else if (1 == endianRecognizer.isBigEndian){
            endianType = KsBigEndian;
        }
    return endianType;
};

//Perform test for 'int'
//This function should print data with 4 bytes size
void KSPrintingBytesOfTheIntValue(void){
    int value = 255;
    void *data = &value;
    size_t sizeOfTheValue = sizeof(value);
    KSTypeOfEndian endianType = 0;
    KSTypeOfEndian theFlagOfEndianType = KSDetectOfTheEndianType();
    
        if (theFlagOfEndianType == KSLittleEndian) {
            endianType = KSLittleEndian;
        }else if (theFlagOfEndianType == KsBigEndian){
            endianType = KsBigEndian;
        }
    KSOutputDataFieldOfSize (data, sizeOfTheValue, endianType);
    
    printf("is %d in decimal and has adress: %p \n\n",value , data);
    
        }
