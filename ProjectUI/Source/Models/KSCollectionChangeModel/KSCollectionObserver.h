//
//  KSArrayModelObserver.h
//  KSProjectUI
//
//  Created by Serg Bla on 17.02.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol KSArrayModelObserver <NSObject>

@optional
- (void)collection:(id)collection didChangeWithModel:(id)changeModel;

@end