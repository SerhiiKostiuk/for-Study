//
//  KSContext.h
//  KSProjectUI
//
//  Created by Serg Bla on 15.03.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KSContext : NSObject

@property (nonatomic, strong) id model;

- (void)execute;
- (void)cancel;

@end
