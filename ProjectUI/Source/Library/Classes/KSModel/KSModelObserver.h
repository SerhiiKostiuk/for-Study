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
- (void)modelWillLoad:(id)model;
- (void)modelDidFinishLoading:(id)model;
- (void)modelDidCancelLoading:(id)model;
- (void)modelDidFailLoading:(id)model withError:(NSError *)error;

@end
