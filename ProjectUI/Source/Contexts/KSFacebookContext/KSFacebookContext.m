//
//  KSFacebookContext.m
//  KSProjectUI
//
//  Created by Serg Bla on 22.03.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSFacebookContext.h"

#import "FBSDKCoreKit/FBSDKCoreKit.h"
#import "KSModel.h"
#import "KSFacebookConstants.h"
#import "KSDispatch.h"

#import "KSJSONHeaders.h"
#import "KSWeakifyMacro.h"

KSModelForModelPropertySyntesize(KSFacebookContext, KSModel, facebookModel);

@interface KSFacebookContext ()
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

- (NSDictionary *)parameters {
    return nil;
}

#pragma mark -
#pragma mark Public

- (void)cancel {
    [super cancel];
    self.connection = nil;
}

- (FBSDKGraphRequest *)graphRequest {
    return [[FBSDKGraphRequest alloc] initWithGraphPath:self.path parameters:self.parameters];
}

- (void)handleResponse:(NSURLResponse *)response withResult:(NSDictionary *)result {
    [self fillModelWithResult:result];
}

- (void)fillModelWithResult:(NSDictionary *)result {
    
}

- (void)load {
    KSWeakify(self);
    KSDispatchAsyncOnMainQueue(^{
        KSStrongifyAndReturnIfNil(self);
        FBSDKGraphRequestConnection *connection = [[FBSDKGraphRequestConnection alloc] init];
        [connection addRequest:[self graphRequest] completionHandler:[self completionHandler]];
        
        self.connection = connection;
    });
}

#pragma mark -
#pragma mark Private 

- (FBSDKGraphRequestHandler)completionHandler {
    KSModel *model = self.facebookModel;
    KSWeakify(self);
    return ^(FBSDKGraphRequestConnection *connection, NSDictionary *result, NSError *error) {
        KSStrongifyAndReturnIfNil(self);
        if (error || result[kFBError]) {
            @synchronized(model) {
                [model setState:KSModelStateFailedLoading withObject:error];

                return;
            }
            
        }
        
        result = result.JSONRepresentation;
        [self handleResponse:connection.URLResponse withResult:result];
        
        @synchronized(model) {
            model.state = KSModelStateFinishedLoading;
        }
    };
}

@end
