//
//  AppDelegate.m
//  NSPredicate
//
//  Created by 曹航玮 on 2017/1/28.
//  Copyright © 2017年 曹航玮. All rights reserved.
//

#import "AppDelegate.h"
#import "HWSearchVC.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[[HWSearchVC alloc] initWithStyle:(UITableViewStyleGrouped)]];
    [self.window makeKeyAndVisible];
    
    return YES;
}





@end
