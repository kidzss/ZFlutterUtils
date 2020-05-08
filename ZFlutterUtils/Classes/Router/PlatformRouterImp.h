//
//  PlatformRouterImp.h
//  ZFlutterUtils
//
//  Created by 周刚涛 on 2020/5/4.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <flutter_boost/FlutterBoost.h>

@protocol FLBPlatform;

NS_ASSUME_NONNULL_BEGIN

/**
* 实现平台侧的页面打开和关闭，不建议直接使用用于页面打开，
* 建议使用FlutterBoostPlugin中的open和close方法来打开或关闭页面；
* FlutterBoostPlugin带有页面返回数据的能力
*/
@interface PlatformRouterImp : NSObject<FLBPlatform>

@end

NS_ASSUME_NONNULL_END
