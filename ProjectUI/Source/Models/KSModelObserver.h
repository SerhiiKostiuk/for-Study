//
//  KSModelObserver.h
//  KSProjectUI
//
//  Created by Serg Bla on 24.02.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol KSModelObserver <NSObject>

@optional
- (void)modelDidReadyToLoad:(id)model;
- (void)modelDidLoad:(id)model;
- (void)modelDidCancelLoading:(id)model;
- (void)modelDidFailToLoad:(id)model;

@end
