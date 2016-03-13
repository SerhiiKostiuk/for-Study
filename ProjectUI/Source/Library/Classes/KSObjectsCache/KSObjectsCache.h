//
//  KSObjectsCache.h
//  KSProjectUI
//
//  Created by Serg Bla on 12.03.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KSObjectsCache : NSObject

- (id)objectForKey:(id)key;
- (void)setObject:(id)object forKey:(id)key;

- (id)objectForKeyedSubscript:(id)key;
- (void)setObject:(id)object forKeyedSubscript:(id)key;

@end
