//
//  PlatformRouterImp.m
//  ZFlutterUtils
//
//  Created by 周刚涛 on 2020/5/4.
//

#import "PlatformRouterImp.h"
#import "UIViewController+Current.h"
#import "BaseFlutterViewController.h"
//路由的实现类，无论是flutter还是Native
@interface PlatformRouterImp ()

@end

@implementation PlatformRouterImp

#pragma mark - Boost 1.5
- (void)open:(NSString *)name
   urlParams:(NSDictionary *)params
        exts:(NSDictionary *)exts
  completion:(void (^)(BOOL))completion {
    NSURL *url = [NSURL URLWithString:name];
    if ([url.host isEqualToString:@"native"]) {
        [self handleNativeRouter:name urlParams:params exts:exts completion:completion];
    } else if ([url.host isEqualToString:@"flutter"]) {
        [self handleFlutterRouter:name urlParams:params exts:exts completion:completion];
    } else {
        //TODO:做异常处理
    }
}

- (void)present:(NSString *)name
   urlParams:(NSDictionary *)params
        exts:(NSDictionary *)exts
  completion:(void (^)(BOOL))completion {
    BOOL animated = [exts[@"animated"] boolValue];
    BaseFlutterViewController *vc = BaseFlutterViewController.new;
    [vc setName:name params:params];
    UINavigationController *nav = [UINavigationController z_topNavigationController];
    [nav presentViewController:vc animated:animated completion:^{
        if(completion) completion(YES);
    }];
}

- (void)close:(NSString *)uid
       result:(NSDictionary *)result
         exts:(NSDictionary *)exts
   completion:(void (^)(BOOL))completion {
    BOOL animated = [exts[@"animated"] boolValue];
    animated = YES;
    UINavigationController *nav = [UINavigationController z_topNavigationController];
    BaseFlutterViewController *vc = (id)nav.presentedViewController;
    if([vc isKindOfClass:BaseFlutterViewController.class] && [vc.uniqueIDString isEqual: uid]) {
        [vc dismissViewControllerAnimated:animated completion:^{}];
    } else {
        [nav popViewControllerAnimated:animated];
    }
}

- (void)handleNativeRouter:(NSString *)name
                 urlParams:(NSDictionary *)params
                      exts:(NSDictionary *)exts
                completion:(void (^)(BOOL))completion {
//    Class class = _router[name];
//    id<RouterProtocol> nativeClass = [[class alloc]init];
//    BOOL isConform = [nativeClass conformsToProtocol:@protocol(RouterProtocol)];
//
//    if (!isConform) {
//        return;
//    }
//
//    UINavigationController *nav = [UINavigationController z_topNavigationController];
//    [nativeClass routerWithNav:nav params:params];
//TODO: 直接走路由
}

- (void)handleFlutterRouter:(NSString *)name
                  urlParams:(NSDictionary *)params
                       exts:(NSDictionary *)exts
                 completion:(void (^)(BOOL))completion {
    BOOL animated = [exts[@"animated"] boolValue];
    BaseFlutterViewController *vc = BaseFlutterViewController.new;
    [vc setName:name params:params];
    UINavigationController *nav = [UINavigationController z_topNavigationController];
    [nav pushViewController:vc animated:animated];
    
    if(completion) {
        completion(YES);
    }
}

@end

