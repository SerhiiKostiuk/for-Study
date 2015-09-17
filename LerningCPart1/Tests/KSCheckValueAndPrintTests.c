//
//  KSCheckValueAndPrintTests.c
//  LerningCPart1
//
//  Created by Serg Bla on 17.09.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#include "KSCheckValueAndPrint.h"
// Function test with using loop with 1000 itetation
void KSCheckValueAndPrintTests(){

    //Define for loop
    for (int count =0; count<1000; count++) {
        
        // Definition of local variable
        int currentCount = count;
        
        // Print the current counter value
        printf("counter = %d\n",currentCount);
        
        // Run function with current counter value in parametrs
        KSCheckValueAndPrint(currentCount);
    }



}