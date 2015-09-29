//
//  KSTypeRepresentationInBinary.c
//  LerningCPart1
//
//  Created by Serg Bla on 25.09.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//
#include <stdio.h>
#include "KSTypeRepresentationInBinary.h"

#pragma mark -
#pragma Private Declarations

static const int kKSCountOfBit = 8;
static const int kKSTheLowerBitMask = 1;

static
void KSOutputDataFieldOfSize(void *data, size_t size);

static
void KSOutputByte(uint8_t value);

#pragma mark -
#pragma Public Implementations

void KSPrintTheTypeInBinaryForm (short value){

    KSOutputDataFieldOfSize(&value, sizeof(value));
    printf("\n\n");
}

#pragma mark -
#pragma Private Implementations

void KSOutputDataFieldOfSize(void *data, size_t size){
//    for (size_t index = 0; index < size; index++) {
//        if (index) {
//            printf(" ");
//        }
//        
//        uint8_t byte = *((uint8_t *)data +index);
//        KSOutputByte(byte);
//    }
//    printf("\n");
    
    while (size) {
        size--;
        KSOutputByte(((uint8_t *)data)[size]);
        printf(" ");
    }
}

void KSOutputByte(uint8_t value) {
    
    for (int bitIndex = sizeof(value) * kKSCountOfBit; bitIndex !=0; bitIndex--) {
        printf("%d",((value >> (bitIndex - 1))& kKSTheLowerBitMask));
    }
}
