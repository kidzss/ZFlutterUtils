//
//  BaseFlutterViewController.m
//  ZFlutterUtils
//
//  Created by 周刚涛 on 2020/5/3.
//
#import "BaseFlutterViewController.h"

@interface BaseFlutterViewController ()

@end

@implementation BaseFlutterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.modalPresentationStyle = UIModalPresentationFullScreen;
}

//Flutter 页面默认隐藏导航栏
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)dealloc {
    NSLog(@"%@----dealloc",NSStringFromClass([self class]));
}

- (NSString*)pageName {
    return @"base";
}

@end
