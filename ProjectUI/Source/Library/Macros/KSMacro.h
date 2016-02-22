//
//  KSMacro.h
//  KSProjectUI
//
//  Created by Serg Bla on 02.02.16.
//  Copyright © 2016 Serg Bla. All rights reserved.
//

#define KSReturnValueIfNil(obj, value) \
    if(!(obj)) { \
        return value; \
    }

#define KSEmpty

#define KSRerurnIfNil(obj)\
    KSReturnValueIfNil(obj, KSEmpty)

#define KSRerurnNilIfNil(obj)\
    KSReturnValueIfNil(obj, 0)