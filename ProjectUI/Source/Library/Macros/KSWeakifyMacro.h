//
//  KSWeakifyMacro.h
//  KSProjectUI
//
//  Created by Serg Bla on 04.02.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSMacro.h"

#define KSClangDiagnosticPush    _Pragma ("clang diagnostic push")
#define KSClangDiagnosticPop     _Pragma ("clang diagnostic pop")

#define KSClangDiagnosticPushOption(option) \
    KSClangDiagnosticPush \
    _Pragma(option) \

#define KSClangDiagnosticPopOption KSClangDiagnosticPop

#define KSWeakify(obj) __weak typeof(obj) __weak_##obj = obj

#define KSStrongify(obj) \
    KSClangDiagnosticPushOption("clang diagnostic ignored \"-Wshadow\"") \
    __strong typeof(__weak_##obj) obj = __weak_##obj; \
    KSClangDiagnosticPopOption

#define KSStrongifyAndReturnValueIfNil(obj, value) \
    KSStrongify(obj); \
    KSReturnValueIfNil(obj, value)

#define KSStrongifyAndReturnNilIfNil(obj) KSStrongifyAndReturnValueIfNil(obj, nil)

#define KSStrongifyAndReturnIfNil(obj) KSStrongifyAndReturnValueIfNil(obj, KSEmpty)
