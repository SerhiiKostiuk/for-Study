//
//  KSObjservableObject.h
//  LearningDevelop
//
//  Created by Serg Bla on 20.12.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KSObservableObject : NSObject
@property (nonatomic, readonly) NSSet      *observers;
@property (nonatomic, assign)   NSUInteger state;

- (void)setState:(NSUInteger)state withObject:(id)object;

- (void)addObserver:(id)observer;
- (void)addObserversFromArray:(NSArray *)observers;

- (void)removeObserver:(id)observer;
- (void)removeObserversFromArray:(NSArray *)observers;

- (void)notifyObserversWithSelector:(SEL)selector;
- (void)notifyObserversWithSelector:(SEL)selector withObject:(id)object;

- (SEL)selectorForState:(NSUInteger)state;

- (void)performBlockWithNotification:(void(^)(void))block;
- (void)performBlockWithoutNotification:(void(^)(void))block;

@end
