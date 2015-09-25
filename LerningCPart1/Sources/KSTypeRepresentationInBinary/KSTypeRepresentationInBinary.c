//
//  KSTypeRepresentationInBinary.c
//  LerningCPart1
//
//  Created by Serg Bla on 25.09.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//
#include <stdio.h>
#include "KSTypeRepresentationInBinary.h"

void KSPRintTheTypeInBinaryForm (int nameOfType){
    
    for (int amountOfTheBit = sizeof(nameOfType)<<1; amountOfTheBit !=0; amountOfTheBit--) {
        
        if (((nameOfType >> (amountOfTheBit - 1))& 1)!=0) {
            
          printf("1");
            
        } else printf("0");
        
    } printf("\n");
}