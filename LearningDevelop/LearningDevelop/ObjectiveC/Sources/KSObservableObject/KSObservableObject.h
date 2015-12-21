//
//  KSObjservableObject.h
//  LearningDevelop
//
//  Created by Serg Bla on 20.12.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KSObservableObject : NSObject
@property (nonatomic, readonly) NSArray *observers;

- (void)addObserver:(id)observer;
- (void)removeObserver:(id)observer;

- (void)notifyObserversWithSelector:(SEL)selector;
- (void)notifyObserversWithSelector:(SEL)selector withObject:(id)object;
- (void)notifyObserversWithSelector:(SEL)selector withObject:(id)object withObject:(id)object2;

@end
