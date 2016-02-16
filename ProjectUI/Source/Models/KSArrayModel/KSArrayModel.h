//
//  KSArrayModel.h
//  KSProjectUI
//
//  Created by Serg Bla on 12.02.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSObservableObject.h"

@interface KSArrayModel : KSObservableObject
@property (nonatomic, readonly) NSArray     *objects;
@property (nonatomic, readonly) NSUInteger  count;

- (id)objectAtIndex:(NSUInteger)index;
- (void)addObject:(id)object;
- (void)insertObjectAtIndex:(id)object index:(NSUInteger)index;
- (void)removeLastObject;
- (void)removeObjectAtIndex:(NSUInteger)index;
- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject;
- (void)exchangeObjectAtIndex:(NSUInteger)firstIndex withObjectAtIndex:(NSUInteger)secondIndex;
- (void)moveObjectAtIndex:(NSUInteger)firstIndex toIndex:(NSUInteger)secondIndex;


@end
