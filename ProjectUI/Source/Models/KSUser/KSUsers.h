//
//  KSUsers.h
//  KSProjectUI
//
//  Created by Serg Bla on 10.02.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSArrayModel.h"

@interface KSUsers : KSArrayModel <NSCoding>

- (void)saveUsers;
- (id)loadUsers;

@end
