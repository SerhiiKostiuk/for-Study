//
//  KSUsers.h
//  KSProjectUI
//
//  Created by Serg Bla on 10.02.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSArrayModel.h"

#import "KSModelObserver.h"

@interface KSUsers : KSArrayModel <KSModelObserver>

- (void)save;
- (void)load;

@end
