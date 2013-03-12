//
//  AppDelegate.m
//  CustomGroupedTableViewCell
//
//  Created by Yoshiki Kurihara on 13/03/12.
//  Copyright (c) 2013年 Yoshiki Kurihara. All rights reserved.
//

#import "AppDelegate.h"
#import "SampleTableViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    SampleTableViewController *vc = [[SampleTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
    self.window.rootViewController = vc;
    
    [self.window makeKeyAndVisible];
    return YES;
}

@end
