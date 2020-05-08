//
//  ZAppDelegate.m
//  ZFlutterUtils
//
//  Created by gangtao.zhou on 05/03/2020.
//  Copyright (c) 2020 gangtao.zhou. All rights reserved.
//

#import "ZAppDelegate.h"
#import "GeneratedPluginRegistrant.h"
#import "MyNavigationController.h"
#import "MyTabBarController.h"
#import <ZFlutterUtils/PlatformRouterImp.h>
#import <flutter_boost/FlutterBoost.h>
#import "LoginViewController.h"

@interface ZAppDelegate ()

@property (nonatomic, strong) PlatformRouterImp *router;

@end

@implementation ZAppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    _router = [PlatformRouterImp new];
    [FlutterBoostPlugin.sharedInstance startFlutterWithPlatform:_router
                                                        onStart:^(FlutterEngine *engine) {
    }];

    self.window = [[UIWindow alloc] initWithFrame: [UIScreen mainScreen].bounds];

    [self isLogin:NO];
    [self.window makeKeyAndVisible];

    return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

- (void)isLogin:(BOOL)login {
    if (login) {
        UITabBarController *tabVC = [[MyTabBarController alloc] init];
        UINavigationController *rvc = [[MyNavigationController alloc] initWithRootViewController:tabVC];
        self.window.rootViewController = rvc;
    } else {
        UIViewController *loginVC = [[LoginViewController alloc] init];
        UINavigationController *rvc = [[MyNavigationController alloc] initWithRootViewController:loginVC];
        self.window.rootViewController = rvc;
    }
}

@end
