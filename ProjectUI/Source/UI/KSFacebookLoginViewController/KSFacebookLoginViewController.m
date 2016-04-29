//
//  KSFacebookLoginViewController.m
//  KSProjectUI
//
//  Created by Serg Bla on 16.03.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSFacebookLoginViewController.h"
#import "FBSDKCoreKit/FBSDKAccessToken.h"
#import "KSUser.h"
#import "KSFacebookLoginContext.h"
#import "KSFriendsViewController.h"
#import "KSCoreDataManager.h"
#import "UIAlertView+KSExtensions.h"
#import "KSModel.h"

@implementation KSFacebookLoginViewController

#pragma mark -
#pragma mark Interface Handling

- (IBAction)onLogin:(id)sender {
    self.model = [KSModel new];
    self.context = [self itemsLoadingContext];
}

#pragma mark -
#pragma mark Public

- (void)updateViewController {
    [self presentFriendsViewController];
}

- (id)itemsLoadingContext {
    KSFacebookLoginContext *context = [KSFacebookLoginContext contextWithModel:self.model];
    context.viewController = self;
    
    return context;
}

#pragma mark -
#pragma mark Private 

- (KSUser *)currentTokenUser {
    FBSDKAccessToken *token = [FBSDKAccessToken currentAccessToken];
    if (token) {
        KSUser *user = [self dataBaseSearchUser];

        return user;
    }
    
    return nil;
}

- (void)presentFriendsViewController {
    KSUser *user = [self currentTokenUser];
        KSFriendsViewController *controller = [KSFriendsViewController new];
        controller.model = user;
        
        user = nil;
        
        [self.navigationController pushViewController:controller animated:NO];
}

- (KSUser *)dataBaseSearchUser {
    KSUser *user = nil;
    NSString *entityName = NSStringFromClass([KSUser class]);
    NSString *tokenUserId = [FBSDKAccessToken currentAccessToken].userID;
    
    KSCoreDataManager *manager = [KSCoreDataManager sharedCoreDataManager];
    NSManagedObjectContext *context = manager.managedObjectContext;
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:entityName];
    
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"userId = %@",tokenUserId]];
    
    NSError *error = nil;
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    
    if (!fetchedObjects) {
        [UIAlertView presentWithError:error];
    }
    
    if (fetchedObjects.count == 0) {
        user = [NSEntityDescription insertNewObjectForEntityForName:entityName inManagedObjectContext:context];
        user.userId = tokenUserId;
        
        if (![context save:&error]) {
            [UIAlertView presentWithError:error];
        }
    } else {
        user = fetchedObjects.firstObject;
    }
    
    return user;
}

@end
