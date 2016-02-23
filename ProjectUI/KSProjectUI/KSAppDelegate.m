//
//  KSAppDelegate.m
//  KSProjectUI
//
//  Created by Serg Bla on 28.01.16.
//  Copyright © 2016 Serg Bla. All rights reserved.
// 

#import "KSAppDelegate.h"
//#import "KSSquareViewController.h"
#import "KSUsersViewController.h"
#import "KSUsers.h"

#import "UIWindow+KSExtensions.h"

@interface KSAppDelegate ()

@end

@implementation KSAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIWindow *window = [UIWindow window];
    self.window = window;
    
    KSUsersViewController *controller = [KSUsersViewController new];
    
    KSUsers *users = [KSUsers new];
    controller.users = users;
    
    window.rootViewController = controller;
    
    [window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    NSLog(@"resign");
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    KSUsers *users = [KSUsers new];
    [users saveUsers];
    NSLog(@"background");

}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    KSUsers *users = [KSUsers new];
    [users loadUsers];
    NSLog(@"foreground");

}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    NSLog(@"becomeActive");

}

- (void)applicationWillTerminate:(UIApplication *)application {
}

@end
