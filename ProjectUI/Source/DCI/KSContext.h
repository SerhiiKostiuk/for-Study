//
//  KSContext.h
//  KSProjectUI
//
//  Created by Serg Bla on 15.03.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import <Foundation/Foundation.h>

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

@interface KSContext : NSObject
@property (nonatomic, strong) id model;

+ (instancetype)contextWithModel:(id)model;

- (instancetype)initWithModel:(id)model;

- (void)execute;
- (void)cancel;
- (void)load;
- (NSUInteger)shouldLoadState:(NSUInteger)state;

@end
