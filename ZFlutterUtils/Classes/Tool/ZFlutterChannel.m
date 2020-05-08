//
//  ZFlutterChannel.m
//  ZFlutterUtils
//
//  Created by 周刚涛 on 2020/5/4.
//

#import "ZFlutterChannel.h"
#import "WeakProxy.h"

@interface ZFlutterChannel()

@end

@implementation ZFlutterChannel

#pragma mark - Flutter Call Native
+ (FlutterMethodChannel *)FlutterCallNative:(nonnull NSString *)channelName binaryMessenger:(NSObject<FlutterBinaryMessenger>*)messenger  {
    NSString *name = [NSString stringWithFormat:@"xyz.flutter.io/%@",channelName];
    FlutterMethodChannel *flutterCallNativeChannel = [FlutterMethodChannel methodChannelWithName:name binaryMessenger:messenger];
    return flutterCallNativeChannel;
}

#pragma mark - Native Call Flutter
+ (void)NativeCallFlutter:(nonnull NSString *)channelName
          binaryMessenger:(nonnull NSObject<FlutterBinaryMessenger> *)messenger {
    id obj = [WeakProxy proxyWithTarget:messenger];
    NSString *name = [NSString stringWithFormat:@"xyz.flutter.io/%@",channelName];
    
    FlutterEventChannel *nativeCallFlutterChannel = [FlutterEventChannel eventChannelWithName:name binaryMessenger:obj];
    [nativeCallFlutterChannel setStreamHandler:obj];
}
@end


