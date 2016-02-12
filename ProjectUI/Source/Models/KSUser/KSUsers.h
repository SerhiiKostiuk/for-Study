//
//  KSUsers.h
//  KSProjectUI
//
//  Created by Serg Bla on 10.02.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSObservableObject.h"

@class KSUser;

@interface KSUsers : KSObservableObject
@property (nonatomic, readonly) NSArray     *users;
@property (nonatomic, readonly) NSUInteger  count;


@end
