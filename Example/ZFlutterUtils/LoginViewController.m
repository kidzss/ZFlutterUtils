//
//  ZAppDelegate.m
//  ZFlutterUtils
//
//  Created by gangtao.zhou on 05/03/2020.
//  Copyright (c) 2020 gangtao.zhou. All rights reserved.
//

#import "LoginViewController.h"
#import "ZAppDelegate.h"
#import <ZFlutterUtils/Navigator.h>

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 80, 40)];
    [button setTitle:@"login" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(loginAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];

    button.center = self.view.center;
    
    
    UIButton *open = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 180, 40)];
    [open setTitle:@"open page1" forState:UIControlStateNormal];
    [open setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [open addTarget:self action:@selector(openPage) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:open];
}

- (void)loginAction {
    ZAppDelegate *delegate = (ZAppDelegate *)[UIApplication sharedApplication].delegate;
    [delegate isLogin:YES];
}

- (void)openPage {
    NSString *url = @"flbdemo://flutter/next";
    [Navigator pushURL:url params:@{@"key":@"page1",@"animated": @YES} completion:^(BOOL flag) {
        NSLog(@"page1 opened %d",flag);
    }];
}

@end
