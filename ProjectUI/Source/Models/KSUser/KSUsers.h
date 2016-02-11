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

- (KSUser *)objectAtIndex:(NSUInteger)index;
- (void)addObject:(KSUser *)object;
- (void)insertObjectAtIndex:(KSUser *)object index:(NSUInteger)index;
- (void)removeLastObject;
- (void)removeObjectAtIndex:(NSUInteger)index;
- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(KSUser *)anObject;
- (void)exchangeObjectAtIndex:(NSUInteger)firstIndex withObjectAtIndex:(NSUInteger)secondIndex;

@end
