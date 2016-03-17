//
//  KSAppDelegate.m
//  KSProjectUI
//
//  Created by Serg Bla on 28.01.16.
//  Copyright © 2016 Serg Bla. All rights reserved.
// 

#import "KSAppDelegate.h"

#import <FBSDKCoreKit/FBSDKCoreKit.h>

#import "KSFacebookLoginViewController.h"
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
    
    KSFacebookLoginViewController *controller = [KSFacebookLoginViewController new];
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:controller];
//    KSUsers *users = [KSUsers new];
//    self.users = users;
//    controller.users = users;
    
    window.rootViewController = navigationController;
    
    [window makeKeyAndVisible];
    
    [[FBSDKApplicationDelegate sharedInstance] application:application
                             didFinishLaunchingWithOptions:launchOptions];
    
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
    [FBSDKAppEvents activateApp];
}

- (void)applicationWillTerminate:(UIApplication *)application {
    NSLog(@"terminate");
}

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    return [[FBSDKApplicationDelegate sharedInstance] application:application
                                                          openURL:url
                                                sourceApplication:sourceApplication
                                                       annotation:annotation];
}

@end
