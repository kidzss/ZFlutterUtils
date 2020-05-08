//
//  ZAppDelegate.m
//  ZFlutterUtils
//
//  Created by gangtao.zhou on 05/03/2020.
//  Copyright (c) 2020 gangtao.zhou. All rights reserved.
//

#import "NativeViewController.h"
#import <ZFlutterUtils/Navigator.h>

@interface NativeViewController ()

@property (nonatomic, strong) UITextView *textView;

@property (nonatomic, strong) NSDictionary *params;

@end

@implementation NativeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.textView = [[UITextView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:_textView];
    if (_params) {
            NSData *data = [NSJSONSerialization dataWithJSONObject:_params options:NSJSONWritingPrettyPrinted error:nil];
        NSString *stringVal = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        self.textView.text = stringVal;
    }

    UIButton *open = [[UIButton alloc]initWithFrame:CGRectMake(100, 60, 280, 40)];
    [open setTitle:@"open flutter page" forState:UIControlStateNormal];
    [open setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [open addTarget:self action:@selector(openPage) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:open];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)openPage {
    NSString *url = @"flbdemo://flutter/next";
    [Navigator pushURL:url params:@{@"key":@"page1",@"animated": @YES} completion:^(BOOL flag) {
        NSLog(@"page1 opened %d",flag);
    }];
}

@end
