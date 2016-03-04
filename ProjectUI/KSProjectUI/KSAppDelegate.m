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
@property (nonatomic, strong) KSUsers *users;

@end

@implementation KSAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIWindow *window = [UIWindow window];
    self.window = window;
    
    KSUsersViewController *controller = [KSUsersViewController new];
    
    KSUsers *users = [KSUsers new];
    self.users = users;
    controller.users = users;
    
    window.rootViewController = controller;
    
    [window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    NSLog(@"resign");
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    NSLog(@"background");
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    NSLog(@"foreground");
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    NSLog(@"become active");
}

- (void)applicationWillTerminate:(UIApplication *)application {
    NSLog(@"terminate");
}

@end
