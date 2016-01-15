//
//  KSObjservableObject.h
//  LearningDevelop
//
//  Created by Serg Bla on 20.12.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KSEmployeeProtocol.h"

@interface KSObservableObject : NSObject //<KSEmployeeProtocol>
@property (nonatomic, readonly) NSSet      *observers;
@property (nonatomic, assign)   NSUInteger state;


- (void)addObserver:(id)observer;
- (void)removeObserver:(id)observer;

- (void)notifyObserversWithSelector:(SEL)selector;
- (void)notifyObserversWithSelector:(SEL)selector withObject:(id)object;

- (SEL)selectorForState:(NSUInteger)state;


@end
