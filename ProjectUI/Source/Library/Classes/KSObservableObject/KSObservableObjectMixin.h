//
//  KSObservableObjectMixin.h
//  KSProjectUI
//
//  Created by Serg Bla on 04.05.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol KSObservableObjectMixin <NSObject>
@optional

@property (nonatomic, readonly) NSSet      *observers;
@property (nonatomic, assign)   NSUInteger state;
@property (nonatomic, strong)   id         target;

- (instancetype)initWithTarget:(id)target;

- (void)setState:(NSUInteger)state withObject:(id)object;

- (void)addObserverObject:(id)observer;
- (void)addObserversFromArray:(NSArray *)observers;

- (void)removeObserver:(id)observer;
- (void)removeObserversFromArray:(NSArray *)observers;

- (void)notifyObserversWithSelector:(SEL)selector;
- (void)notifyObserversWithSelector:(SEL)selector withObject:(id)object;

- (SEL)selectorForState:(NSUInteger)state;

- (void)performBlockWithNotification:(void(^)(void))block;
- (void)performBlockWithoutNotification:(void(^)(void))block;

@end
