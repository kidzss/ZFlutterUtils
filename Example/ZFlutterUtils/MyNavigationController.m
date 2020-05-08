//
//  ZAppDelegate.m
//  ZFlutterUtils
//
//  Created by gangtao.zhou on 05/03/2020.
//  Copyright (c) 2020 gangtao.zhou. All rights reserved.
//

#import "MyNavigationController.h"

@interface MyNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation MyNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationBarHidden:YES animated:NO];
    self.interactivePopGestureRecognizer.delegate = self;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    return [super pushViewController:viewController animated:animated];
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    if (self.viewControllers.count <= 1) {
        return NO;
    }
    return YES;
}

@end
