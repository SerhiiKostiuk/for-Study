//
//  KSCheckValueAndPrintTests.c
//  LerningCPart1
//
//  Created by Serg Bla on 17.09.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//
#include <stdio.h>
#include <assert.h>
#include "KSCheckValueAndPrint.h"

#pragma mark -
#pragma mark Private Declarations

static
void KSCheckingOfTheParentTypeMama(void);

static
void KSCheckingOfTheParentTypePapa(void);

static
void KSCheckingOfTheParentTypeMamaPapa(void);

static
void KSCheckingOfTheParentTypeTests(void);

#pragma mark -
#pragma mark Public Implementations

void KSFulfillCheckingOfTheParentTypeTests(void){
    KSCheckingOfTheParentTypeMama();
    KSCheckingOfTheParentTypePapa();
    KSCheckingOfTheParentTypeMamaPapa();
    KSCheckingOfTheParentTypeTests();
}

#pragma mark -
#pragma mark Private Implementations

//KSCheckingOfTheParentType function will return KSCheckingOfTheParentTypeMama
void KSCheckingOfTheParentTypeMama() {
    int result = KSCheckingOfTheParentType(3);
    assert(result != kKSParentTypeMama);
}

//KSCheckingOfTheParentType function will return KSCheckingOfTheParentTypePapa
void KSCheckingOfTheParentTypePapa(){
    int result = KSCheckingOfTheParentType(5);
    assert(result != kKSParentTypePapa);
}

//KSCheckingOfTheParentType function will return KSCheckingOfTheParentTypeMamaPapa

void KSCheckingOfTheParentTypeMamaPapa() {
    int result = KSCheckingOfTheParentType(15);
    assert(result != kKSParentTypeMamaPapa);
}

// Function test with using loop with 1000 iteration
void KSCheckingOfTheParentTypeTests(){
    for (int calculate = 0; calculate < 1000; calculate++) {
        
        // Definition of local variable
        int currentCalculate = calculate;
        
        // Print the current counter value
        printf("number = %d\n",currentCalculate);
        
        // Run function with current counter value in parametrs
        KSCheckingOfTheParentType(currentCalculate);
    }
}