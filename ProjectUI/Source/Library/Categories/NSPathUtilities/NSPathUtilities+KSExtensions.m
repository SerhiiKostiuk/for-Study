//
//  NSPathUtilities+KSExtensions.m
//  KSProjectUI
//
//  Created by Serg Bla on 23.02.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "NSPathUtilities+KSExtensions.h"

NSString *NSSearchPathForDirectory(NSSearchPathDirectory direcrory) {
    return [NSSearchPathForDirectoriesInDomains(direcrory, NSUserDomainMask, YES) firstObject];
}
