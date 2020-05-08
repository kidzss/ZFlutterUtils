//
//  ZFlutterChannel.h
//  ZFlutterUtils
//
//  Created by 周刚涛 on 2020/5/4.
//

#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZFlutterChannel : NSObject

//建立一个flutter到native的通道，可以通过这个对象响应flutter
+ (FlutterMethodChannel *)FlutterCallNative:(nonnull NSString *)channelName binaryMessenger:(NSObject<FlutterBinaryMessenger>*)messenger;

//建立一个native到flutter的通道
+ (void)NativeCallFlutter:(nonnull NSString *)channelName binaryMessenger:(NSObject<FlutterBinaryMessenger>*)messenger;

@end

NS_ASSUME_NONNULL_END
