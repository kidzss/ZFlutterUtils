//
//  UIViewController+Current.h
//  ZFlutterUtils
//
//  Created by 周刚涛 on 2020/5/4.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (Current)

+ (UIViewController *)z_currentViewController;

+ (UINavigationController *)z_topNavigationController;

@end

NS_ASSUME_NONNULL_END

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Current)

- (UIViewController *)z_topViewController;

@end

NS_ASSUME_NONNULL_END
