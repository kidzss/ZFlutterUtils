//
//  ZAppDelegate.m
//  ZFlutterUtils
//
//  Created by gangtao.zhou on 05/03/2020.
//  Copyright (c) 2020 gangtao.zhou. All rights reserved.
//

#import <flutter_boost/FlutterBoost.h>
#import "MyTabBarController.h"
#import <ZFlutterUtils/BaseFlutterViewController.h>
#import "Tab2ViewController.h"
#import "FirstPageViewController.h"
#import "SecondPageViewController.h"
@interface MyTabBarController ()

@end

@implementation MyTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    FirstPageViewController *fvc = FirstPageViewController.new;
    [fvc setName:@"flbdemo://flutter/tab1" params:@{}];
    fvc.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"tab1" image:nil tag:1];

    Tab2ViewController *vc = [[Tab2ViewController alloc] init];
    vc.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"tab2" image:nil tag:2];

    BaseFlutterViewController *fvc3 = SecondPageViewController.new;
    [fvc3 setName:@"flbdemo://flutter/tab3" params:@{}];
    fvc3.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"tab3" image:nil tag:3];

    BaseFlutterViewController *fvc4 = BaseFlutterViewController.new;
    [fvc4 setName:@"flbdemo://flutter/tab4" params:@{}];
    fvc4.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"tab4" image:nil tag:4];

    self.viewControllers = @[fvc,vc,fvc3,fvc4];
}



@end
