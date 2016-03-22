//
//  KSViewController.m
//  KSProjectUI
//
//  Created by Serg Bla on 20.03.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSViewController.h"

#import "KSFacebookLoginContext.h"

@interface KSViewController ()

@end

@implementation KSViewController

#pragma mark -
#pragma mark Accessors

- (void)setContext:(KSFacebookLoginContext *)context {
    if (_context != context) {
        [_context cancel];
        _context = context;
        [_context execute];
    }
}

@end
