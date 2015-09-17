//
//  KSCheckValueAndPrint.c
//  LerningCPart1
//
//  Created by Serg Bla on 16.09.15.
//  Copyright (c) 2015 Serg Bla. All rights reserved.
//

#include "KSCheckValueAndPrint.h"
KSParentType KSCheckValueAndPrint(int value){

    KSParentType result = kKSParentTypeUndefined;
    
    if (0 == value % 3 ) {
        result = kKSParentTypeMama;
        printf("mama");
    }
    if (0 == value % 5) {
//        if (kKSParentTypeMama == result){
//           result = kKSParentTypeMamaPapa;
//    }else {
//        result = kKSParentTypePapa;
//    }
        result =(kKSParentTypeMama ==result ? kKSParentTypeMamaPapa : kKSParentTypePapa);
    printf("papa");
    }
    if (kKSParentTypeUndefined != result) {
        printf("\n");
    }
    return result;
}