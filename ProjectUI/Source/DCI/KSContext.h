//
//  KSContext.h
//  KSProjectUI
//
//  Created by Serg Bla on 15.03.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^KSVoidBlock)(void);


@interface KSContext : NSObject

- (void)execute:(KSVoidBlock)block;
- (void)cancel;

@end
