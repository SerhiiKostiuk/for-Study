//
//  KSFacebookContext.m
//  KSProjectUI
//
//  Created by Serg Bla on 22.03.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSFacebookContext.h"

#import <FBSDKCoreKit/FBSDKCoreKit.h>

#import "KSModel.h"
#import "KSParsingKeys.h"

#import "KSWeakifyMacro.h"

@interface KSFacebookContext ()
@property (nonatomic, readonly) NSString                    *path;
@property (nonatomic, strong)   FBSDKGraphRequestConnection *connection;

@end

@implementation KSFacebookContext

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    [self cancel];
}

#pragma mark -
#pragma mark Accessors 

- (void)setConnection:(FBSDKGraphRequestConnection *)connection {
    if (_connection != connection) {
        [_connection cancel];
        _connection = connection;
        [_connection start];
    }
}

- (NSString *)path {
    return nil;
}

#pragma mark -
#pragma mark Public

- (void)cancel {
    [super cancel];
    self.connection = nil;
}

- (FBSDKGraphRequest *)graphRequestWithPath {
    return [[FBSDKGraphRequest alloc] initWithGraphPath:self.path parameters:nil];
}

- (void)handleResponse:(NSURLResponse *)response withResult:(NSDictionary *)result {
    
}

- (void)performBackgroundLoading {
    FBSDKGraphRequestConnection *connection = [[FBSDKGraphRequestConnection alloc] init];
    [connection addRequest:[self graphRequestWithPath] completionHandler:[self complitionHandler]];
}

#pragma mark -
#pragma mark Private 

- (id)complitionHandler {
    KSWeakify(self);
    return ^(FBSDKGraphRequestConnection *connection, NSDictionary *result, NSError *error) {
        KSStrongifyAndReturnIfNil(self);
        if (error || result[kFBError]) {
            self.model.state = KSModelStateFailedLoading;
            return;
        }
        
        [self handleResponse:connection.URLResponse withResult:result];
    };
}

@end
