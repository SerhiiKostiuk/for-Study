//
//  KSMacro.h
//  KSProjectUI
//
//  Created by Serg Bla on 02.02.16.
//  Copyright © 2016 Serg Bla. All rights reserved.
//


#define CGWidth(frame) CGRectGetWidth(frame)
#define CGHeight(frame) CGRectGetHeight(frame)

#define weakify(obj) __weak typeof(obj) weakSelf = obj

#define strongify(obj) __strong typeof(obj) obj = weakSelf

#define strongifyAndReturnNilIfNil(obj) __strong typeof(obj) obj = weakSelf \
    if (!obj) { \
        return nil; \
    }

#define strongifyAndReturnIfNil(obj) __strong typeof(obj) obj = weakSelf; \
    if (!obj) { \
        return; \
    }

#define strongifyAndReturnZeroIfNil(obj) __strong typeof(obj) obj = weakSelf \
    if (!obj) { \
        return 0; \
    }


#define KSViewGetterSynthesize(viewClass, selectorName) \
    - (viewClass *)selectorName { \
        if ([self isViewLoaded] && [self.view isKindOfClass:[viewClass class]]) { \
            return (viewClass *)self.view; \
        } \
        \
        return nil; \
    }

