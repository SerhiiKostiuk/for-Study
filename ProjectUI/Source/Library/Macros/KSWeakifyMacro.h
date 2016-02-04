//
//  KSWeakifyMacro.h
//  KSProjectUI
//
//  Created by Serg Bla on 04.02.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#define KSWeakify(obj) __weak typeof(obj) __weak_##obj = obj

#define KSStrongify(obj) \
    _Pragma ("clang diagnostic push") \
    _Pragma ("clang diagnostic ignored \"-Wshadow\"") \
    __strong typeof(__weak_##obj) obj = __weak_##obj \
    _Pragma ("clang diagnostic pop")

#define KSStrongifyAndReturnNilIfNil(obj) KSStrongifyAndReturnValueIfNil(obj, nil)

#define KSEmpty

#define KSStrongifyAndReturnIfNil(obj) KSStrongifyAndReturnValueIfNil(obj, KSEmpty)

#define KSStrongifyAndReturnValueIfNil(obj, value) \
    KSStrongify(obj); \
    if (!obj) { \
        return value; \
    }
