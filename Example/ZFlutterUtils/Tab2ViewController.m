//
//  ZAppDelegate.m
//  ZFlutterUtils
//
//  Created by gangtao.zhou on 05/03/2020.
//  Copyright (c) 2020 gangtao.zhou. All rights reserved.
//

#import "Tab2ViewController.h"
#import "ZAppDelegate.h"
#import "NativeViewController.h"

@interface Tab2ViewController ()

@end

@implementation Tab2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 80, 40)];
    [button setTitle:@"logout" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(logoutAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    button.center = self.view.center;
    
    UIButton *button2 = [[UIButton alloc]initWithFrame:CGRectMake(10, 100, 180, 40)];
    [button2 setTitle:@"nativePage" forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(nativePage) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)logoutAction {
    ZAppDelegate *delegate = (ZAppDelegate *)[UIApplication sharedApplication].delegate;
    [delegate isLogin:NO];
}

- (void)nativePage {
    NativeViewController *vc = NativeViewController.new;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
