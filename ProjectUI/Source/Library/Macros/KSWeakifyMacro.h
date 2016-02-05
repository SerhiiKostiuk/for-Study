//
//  KSWeakifyMacro.h
//  KSProjectUI
//
//  Created by Serg Bla on 04.02.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#define KSClangDiagnosticPush    _Pragma ("clang diagnostic push")
#define KSClangDiagnosticPop     _Pragma ("clang diagnostic pop")
#define KSClangDiagnosticIgnored _Pragma ("clang diagnostic ignored \"-Wshadow\"")

#define KSClangDiagnosticPushIgnored \
    KSClangDiagnosticPush \
    KSClangDiagnosticIgnored \

#define KSWeakify(obj) __weak typeof(obj) __weak_##obj = obj

#define KSStrongify(obj) \
    KSClangDiagnosticPushIgnored \
    __strong typeof(__weak_##obj) obj = __weak_##obj; \
    KSClangDiagnosticPop

#define KSStrongifyAndReturnValueIfNil(obj, value) \
    KSStrongify(obj); \
    if (!obj) { \
        return value; \
    }

#define KSStrongifyAndReturnNilIfNil(obj) KSStrongifyAndReturnValueIfNil(obj, nil)

#define KSEmpty

#define KSStrongifyAndReturnIfNil(obj) KSStrongifyAndReturnValueIfNil(obj, KSEmpty)

