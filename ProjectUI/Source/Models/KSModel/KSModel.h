//
//  KSModel.h
//  KSProjectUI
//
//  Created by Serg Bla on 24.02.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSObservableObject.h"

typedef NS_ENUM(NSUInteger, KSModelState) {
    KSModelStateFailedLoading,
    KSModelStateUnloaded,
    KSModelStateFinishedLoading,
    KSModelStateLoading,
    KSModelStateCount
};

@interface KSModel : KSObservableObject

- (void)load;

@end
