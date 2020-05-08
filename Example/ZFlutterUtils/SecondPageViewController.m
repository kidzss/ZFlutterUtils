//
//  ZAppDelegate.m
//  ZFlutterUtils
//
//  Created by gangtao.zhou on 05/03/2020.
//  Copyright (c) 2020 gangtao.zhou. All rights reserved.
//

#import <Flutter/Flutter.h>
#import <ZFlutterUtils/ZFlutterChannel.h>
#import "SecondPageViewController.h"
#import <Flutter/Flutter.h>
#import "WeakProxy.h"

static NSString*nativeCallFlutter = @"nativeCallFlutter";
static NSString*flutterCallNative = @"flutterCallNative";

@interface SecondPageViewController ()<FlutterStreamHandler,FlutterBinaryMessenger>

@property(nonatomic, copy,nullable) FlutterEventSink nativeCallFlutterBlock;

@end

@implementation SecondPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    FlutterMethodChannel * flutterCallNativeChannel = [ZFlutterChannel FlutterCallNative:flutterCallNative binaryMessenger:self];
    
    [flutterCallNativeChannel setMethodCallHandler:^(FlutterMethodCall *call, FlutterResult result) {
        NSLog(@"method: %@",call.method);
        NSLog(@"arguments: %@",call.arguments);

        if([flutterCallNative isEqualToString:call.method]) {
            result(@{@"key":@"flutter call native"});
        }
    }];
    
    [ZFlutterChannel NativeCallFlutter:nativeCallFlutter binaryMessenger:self];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self CallFluterWithName:nativeCallFlutter params:@{@"key":@"native Call Flutter"}];
}

#pragma mark - protocol FlutterStreamHandler
- (FlutterError *)onListenWithArguments:(id)arguments eventSink:(FlutterEventSink)events {
    self.nativeCallFlutterBlock = events;
    return nil;
}

- (FlutterError*)onCancelWithArguments:(id)arguments {
    self.nativeCallFlutterBlock = nil;
    return nil;
}

- (void)CallFluterWithName:(NSString *)name params:(id)params {
    if(self.nativeCallFlutterBlock) {
        self.nativeCallFlutterBlock(@{@"name":name?:@"",@"params":params ?: [NSNull null]});
    } else {
        NSLog(@"nativeCallFlutterBlock 为空");
    }
}

@end
