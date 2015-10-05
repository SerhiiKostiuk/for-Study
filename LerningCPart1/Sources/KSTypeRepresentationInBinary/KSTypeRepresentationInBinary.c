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


void KSOutputDataFieldOfSize();

static
void KSOutputByte(uint8_t value);

#pragma mark -
#pragma Public Implementations

void KSOutputDataFieldOfSize(void *data, size_t size, KSTypeOfEndian endianType){
    
    if (kKSLittleEndian == endianType) {
        
        for (size_t index = 0; index < size; index++) {
            if (index) {
                printf(" ");
            }
            uint8_t byte = *((uint8_t *)data + index);
            KSOutputByte(byte);
        }
    } else if (kKSBigEndian == endianType){
        
        while (size) {
            size--;
            KSOutputByte(((uint8_t *)data)[size]);
            printf(" ");
        }
    }
    printf("\n");
}

#pragma mark -
#pragma Private Implementations


void KSOutputByte(uint8_t value) {
    
    for (int bitIndex = sizeof(value) * kKSCountOfBit; bitIndex !=0; bitIndex--) {
        printf("%d",((value >> (bitIndex - 1))& kKSTheLowerBitMask));
        
        if (0 == (bitIndex % kKSCountOfBit)-1) {
            printf(" ");
        }
    }
}
