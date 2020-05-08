//
//  BaseFlutterNavigationController.m
//  ZFlutterUtils
//
//  Created by 周刚涛 on 2020/5/4.
//

#import "BaseFlutterNavigationController.h"

@interface BaseFlutterNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation BaseFlutterNavigationController

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
