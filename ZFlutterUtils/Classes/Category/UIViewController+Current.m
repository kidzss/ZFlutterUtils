//
//  UIViewController+Current.m
//  ZFlutterUtils
//
//  Created by 周刚涛 on 2020/5/4.
//

#import "UIViewController+Current.h"

@implementation UIViewController (Current)

+ (UIViewController *)z_currentViewController; {
    UIViewController *resultVC;
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    if (window.windowLevel != UIWindowLevelNormal) {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows) {
            if (tmpWin.windowLevel == UIWindowLevelNormal) {
                window = tmpWin;
                break;
            }
        }
    }
    
    if ([window subviews].count == 0) {
        return nil;
    }
    
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    if ([nextResponder isKindOfClass:[UIViewController class]]) {
        resultVC = nextResponder;
    } else {
        resultVC = window.rootViewController;
    }
    
    BOOL isContinue = YES;
    
    while (isContinue) {
        if ([resultVC isKindOfClass:[UINavigationController class]]) {
            UINavigationController *navController = (UINavigationController *)resultVC;
            resultVC = navController.visibleViewController;
        } else if ([resultVC isKindOfClass:[UITabBarController class]]) {
            UITabBarController *tabBarController = (UITabBarController *)resultVC;
            resultVC = tabBarController.selectedViewController;
        } else if (resultVC.presentedViewController) {
            resultVC = resultVC.presentedViewController;
        } else {
            isContinue = NO;
        }
    }
    
    return resultVC;
}

+ (UIViewController *)currentViewController {
    return [self z_currentViewController];
}


+ (UINavigationController *)z_topNavigationController {
    UINavigationController *navi = [[UIViewController z_currentViewController] navigationController];
    if (navi) {
        return navi;
    } else {
        UIViewController * root = [UIApplication sharedApplication].keyWindow.rootViewController;
        if ([root isKindOfClass:[UITabBarController class]]) {
            UITabBarController * tabBar = (UITabBarController *)root;
            return tabBar.selectedViewController;
        } else if ([root isKindOfClass:[UINavigationController class]]) {
            return (UINavigationController *)root;
        } else {
            return root.navigationController;
        }
    }
}

@end

@implementation UIView (Current)

- (UIViewController *)z_topViewController {
    id next = [self nextResponder];
    if ([next isKindOfClass:[UIViewController class]]) {
        return next;
    }
    if (self.superview) {
        id sub = [self.superview z_topViewController];
        if ([sub isKindOfClass:[UIViewController class]]) {
            return sub;
        }
    }
    return nil;
}

@end
