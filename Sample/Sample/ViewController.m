//
// Sample
// ViewController.m
//
// Created by wuyikai on 2020/2/4.
// Copyright © 2020 wuyikai. All rights reserved.
// 

#import "ViewController.h"
#import "AppDelegate.h"
@import Flutter;

@interface ViewController ()<FlutterStreamHandler>

@property (nullable, nonatomic, copy) FlutterEventSink eventSink;//像 flutter 发送数据

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    FlutterViewController *flutterViewController = [[FlutterViewController alloc] initWithProject:nil nibName:nil bundle:nil];
    [flutterViewController setInitialRoute:@"home"];
    [self.navigationController pushViewController:flutterViewController animated:YES];
    
    // Event channel, Native 主动调用 Flutter 方法
    NSString *channelName = @"samples.flutter.io/event";
    FlutterEventChannel *evenChannal = [FlutterEventChannel eventChannelWithName:channelName binaryMessenger:flutterViewController.binaryMessenger];
    // 代理FlutterStreamHandler
    [evenChannal setStreamHandler:self];
}

- (IBAction)_showFlutter:(UIButton *)sender {
    FlutterEngine *flutterEngine = ((AppDelegate *)UIApplication.sharedApplication.delegate).flutterEngine;
    FlutterViewController *flutterViewController = [[FlutterViewController alloc] initWithEngine:flutterEngine nibName:nil bundle:nil];
    [self.navigationController pushViewController:flutterViewController animated:YES];
    
    // Method channel, Flutter 主动调用 Native 方法
    FlutterMethodChannel *channel = [FlutterMethodChannel
                                            methodChannelWithName:@"samples.flutter.io/battery"
                                            binaryMessenger:flutterViewController.binaryMessenger];
    
    [channel setMethodCallHandler:^(FlutterMethodCall* call, FlutterResult result) {
        NSLog(@"call %@, arguments: %@", call.method, call.arguments);
        if ([@"getBatteryLevel" isEqualToString:call.method]) {
            int batteryLevel = [self getBatteryLevel];
            
            if (batteryLevel == -1) {
                result([FlutterError errorWithCode:@"UNAVAILABLE"
                                           message:@"Battery info unavailable"
                                           details:nil]);
            } else {
                result(@(batteryLevel));
            }
        } else {
            result(FlutterMethodNotImplemented);
        }
    }];
    
    // Method channel, Native 主动调用 Flutter 方法
    [channel invokeMethod:@"log" arguments:@{@"foo": @"bar"} result:^(id  _Nullable result) {
        NSLog(@"flutter result: %@", result);
    }];
}

- (int)getBatteryLevel {
    UIDevice *device = UIDevice.currentDevice;
    device.batteryMonitoringEnabled = YES;
    if (device.batteryState == UIDeviceBatteryStateUnknown) {
        return -1;
    } else {
        return (int)(device.batteryLevel * 100);
    }
}

#pragma mark - FlutterStreamHandler

- (FlutterError *)onListenWithArguments:(id)arguments eventSink:(FlutterEventSink)events {
    //arguments 接收到的 flutter 参数
    //events 该 block 可像 flutter 发送数据
    NSLog(@"Flutter 开始监听 Native 事件: %@", arguments);
    self.eventSink = events;
    
    if (events) {
        events(@"传值给 flutter");
    }
    return nil;
}

- (FlutterError *)onCancelWithArguments:(id)arguments {
    //arguments 接收到的 flutter 参数
    NSLog(@"Flutter 停止监听 Native 事件: %@", arguments);
    return nil;
}

@end
