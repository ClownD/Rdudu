//
//  AppDelegate.m
//  UIAAAAAAAAAAAAAAAAAAAAAAAAAAAA
//
//  Created by dllo on 16/9/19.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeViewController.h"
#import "BookViewController.h"
#import "MusicViewController.h"
#import "FilmViewController.h"
#import "IDViewController.h"
@interface AppDelegate ()
<
UITabBarControllerDelegate
>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    
    
    
    
    HomeViewController *homeVC = [[HomeViewController alloc] init];
    homeVC.title = @"ONE";
    UINavigationController *homeNavigationController = [[UINavigationController alloc] initWithRootViewController:homeVC];
    UIImage *homeImage = [UIImage imageNamed:@"home2"];
    homeImage = [homeImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *homeImageAction = [UIImage imageNamed:@"home1"];
    homeImageAction = [homeImageAction imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    homeNavigationController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"首页" image:homeImage selectedImage:homeImageAction];
    
    
    
    
    BookViewController *bookVC = [[BookViewController alloc] init];
    bookVC.title = @"阅读";
    UINavigationController *bookNavigationController = [[UINavigationController alloc] initWithRootViewController:bookVC];
    UIImage *bookImage = [UIImage imageNamed:@"b2.png"];
    bookImage = [bookImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *bookImageAction = [UIImage imageNamed:@"b1.png"];
    bookImageAction = [bookImageAction imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    bookNavigationController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"阅读" image:bookImage selectedImage:bookImageAction];

    
    
    MusicViewController *musicVC = [[MusicViewController alloc] init];
    musicVC.title = @"音乐";
    UINavigationController *musicNavigationController = [[UINavigationController alloc] initWithRootViewController:musicVC];
    UIImage *musicImage = [UIImage imageNamed:@"m2"];
    musicImage = [musicImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *musicImageAction = [UIImage imageNamed:@"m1"];
    musicImageAction = [musicImageAction imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    musicNavigationController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"音乐" image:musicImage selectedImage:musicImageAction];

    
    
    FilmViewController *filmVC = [[FilmViewController alloc] init];
    filmVC.title = @"电影";
    UINavigationController *filmNavigationController = [[UINavigationController alloc] initWithRootViewController:filmVC];
    UIImage *filmImage = [UIImage imageNamed:@"d2"];
    filmImage = [filmImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *filmImageAction = [UIImage imageNamed:@"d1"];
    filmImageAction = [filmImageAction imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    filmNavigationController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"电影" image:filmImage selectedImage:filmImageAction];
    
    
    
    
    UITabBarController *rootTabBarController = [[UITabBarController alloc] init];
    rootTabBarController.viewControllers = @[homeNavigationController,bookNavigationController,musicNavigationController,filmNavigationController];
    rootTabBarController.delegate = self;
    self.window.rootViewController = rootTabBarController;
    return YES;
}


- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
  //  NSLog(@"seleteted %lu",tabBarController.selectedIndex);
    
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
