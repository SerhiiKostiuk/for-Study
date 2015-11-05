//
//  KSMacros.h
//  LerningCPart1
//
//  Created by Serg Bla on 24.10.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#ifndef KSMacros_h
#define KSMacros_h

#define KSObjectGetter(object, fieldName, nullValue)\
        NULL != object ? object->fieldName : nullValue

#define KSObjectAssignSetter(object, fieldName, newValue)\
        if (NULL != object && object->fieldName != newValue) { \
        object->fieldName = newValue;\
        }

#define KSObjectRetainSetter(object, fieldName, newValue)\
        if(NULL == object || object->fieldName == newValue) { \
            return; \
        } \
        KSObjectRelease(object->fieldName); \
        KSObjectRetain(newValue); \
        object->fieldName = newValue;

#define KSReturnIfObjectNULL \
if (NULL == object) {\
return;\
}

#endif /* KSMacros_h */
