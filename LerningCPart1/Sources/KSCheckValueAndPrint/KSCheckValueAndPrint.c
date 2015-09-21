//
//  KSCheckValueAndPrint.c
//  LerningCPart1
//
//  Created by Serg Bla on 16.09.15.
//  Copyright (c) 2015 Serg Bla. All rights reserved.
//
#include <stdio.h>
#include "KSCheckValueAndPrint.h"

#pragma mark -
#pragma mark Private Declarations

const int kKSMamaValue = 3;
const int kKSPapaValue = 5;

KSParentType KSCheckingOfTheParentType(int value){
    KSParentType result = kKSParentTypeUndefined;
    
    if (0 == value){
        return result;
    }
    
    if (0 == value % kKSMamaValue ) {
        result = kKSParentTypeMama;
        printf("mama");
    }
    
    if (0 == value % kKSPapaValue) {
        result =(kKSParentTypeMama ==result) ? kKSParentTypeMamaPapa : kKSParentTypePapa;
        printf("papa");
    }
    
    if (kKSParentTypeUndefined != result) {
        printf("\n");
    }
    
    return result;
    
}