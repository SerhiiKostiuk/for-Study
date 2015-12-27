//
//  KSObserverProtocol.h
//  LearningDevelop
//
//  Created by Serg Bla on 27.12.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KSCashFlowProtocol.h"
@protocol KSObserverProtocol <NSObject>

- (void)performPositionSpecificOperation:(id<CashFlowProtocol>)object;

@end
