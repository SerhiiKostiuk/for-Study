//
//  KSStructure.h
//  LerningCPart1
//
//  Created by Serg Bla on 28.09.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#ifndef KSStructure_h
#define KSStructure_h


#include <stdbool.h>


typedef struct  {
    int variableInt;
    long long variableLongLong;
    bool variableBool2;
    float variableFloat;
    short variableShort1;
    bool variableBool1;
    double variableDouble;
    bool variableBool3;
    short variableShort2;
    char *variableStringPointer;
    bool variableBool4;
    short variableShort3;
    bool variableBool5;
    bool variableBool6;
    
} TheFirstStructure;


typedef struct {
    char *variableStringPointer;
    long long variableLongLong;
    double variableDouble;
    float variableFloat;
    int variableInt;
    short variableShort1;
    short variableShort2;
    short variableShort3;
    bool variableBool1;
    bool variableBool2;
    bool variableBool3;
    bool variableBool4;
    bool variableBool5;
    bool variableBool6;
    
} TheSecondStructure;

typedef struct {
    char *variableStringPointer;
    long long variableLongLong;
    double variableDouble;
    float variableFloat;
    int variableInt;
    short variableShort1;
    short variableShort2;
    short variableShort3;
    union {
        struct {
        bool variableBool1 : 1;
        bool variableBool2 : 1;
        bool variableBool3 : 1;
        bool variableBool4 : 1;
        bool variableBool5 : 1;
        bool variableBool6 : 1;
        }boolFlags;
};
} TheThirdStructure;




#endif /* KSStructure_h */
