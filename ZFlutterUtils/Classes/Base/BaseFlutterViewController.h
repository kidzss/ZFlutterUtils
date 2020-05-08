//
//  BaseFlutterViewController.h
//  ZFlutterUtils
//
//  Created by 周刚涛 on 2020/5/3.
//

#import <UIKit/UIKit.h>
#import <flutter_boost/FlutterBoost.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseFlutterViewController : FLBFlutterViewContainer

@property(nonatomic,copy) NSString *pageName;

@end

NS_ASSUME_NONNULL_END
