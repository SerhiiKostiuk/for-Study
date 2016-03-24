//
//  KSModel.h
//  KSProjectUI
//
//  Created by Serg Bla on 24.02.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSObservableObject.h"

#define KSModelPropertyDefine(modelClass, propertyName) \
@property (nonatomic, strong) modelClass *propertyName;

#define KSModelGetterDefine(modelClass, propertyName) \
- (modelClass *)propertyName { \
    return [self.model isKindOfClass:[modelClass class]] ? (modelClass *)self.model : nil; \
}

#define KSModelForModelPropertySyntesize(contextName, modelClass, propertyName) \
\
@interface contextName (_KSModelProperty__##contextName##__##modelClass##__##propertyName) \
KSModelPropertyDefine(modelClass, propertyName) \
\
@end \
\
@implementation contextName (_KSModelProperty__##contextName##__##modelClass##__##propertyName) \
\
@dynamic propertyName; \
\
KSModelGetterDefine(modelClass, propertyName) \
\
@end

typedef NS_ENUM(NSUInteger, KSModelState) {
    KSModelStateUnloaded,
    KSModelStateFailedLoading,
    KSModelStateFinishedLoading,
    KSModelStateLoading,
    KSModelStateCount
};

@interface KSModel : KSObservableObject

- (void)load;

@end
