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
KSTypeOfEndian KSCurentEndianType(void);

#pragma mark -
#pragma mark Public Implementations

void KSTypeRepresentationInBinaryTests(void){
    
    KSPrintingBytesOfTheIntValue ();
}

#pragma mark -
#pragma mark Private Implementations

//Detecting of the endian type

KSTypeOfEndian KSCurentEndianType(void){
    union {
        uint16_t data;
        struct {
            uint8_t isLittleEndian;
            uint8_t isBigEndian;
        };
    } endianRecognizer;
    
    endianRecognizer.data = 1;
    
    return endianRecognizer.isLittleEndian ? kKSLittleEndian : kKSBigEndian;
};

//Perform test for 'int'
//This function should print data with 4 bytes size
void KSPrintingBytesOfTheIntValue(void){
    int value = 255;
    KSTypeOfEndian endianType = (kKSBigEndian == KSCurentEndianType() ? kKSBigEndian : kKSLittleEndian) ;
    KSTypeOfEndian EndianType = (kKSLittleEndian == KSCurentEndianType() ? kKSBigEndian : kKSLittleEndian);
    KSOutputDataFieldOfSize (&value, sizeof(value), endianType);
    KSOutputDataFieldOfSize (&value, sizeof(value), EndianType);
    
    printf("is %d in decimal.\n\n",value);
    
}
