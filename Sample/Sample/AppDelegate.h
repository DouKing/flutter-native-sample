//
// Sample
// AppDelegate.h
//
// Created by wuyikai on 2020/2/4.
// Copyright © 2020 wuyikai. All rights reserved.
// 

#import <UIKit/UIKit.h>
@import Flutter;
@import FlutterPluginRegistrant;

@interface AppDelegate : UIResponder <UIApplicationDelegate, FlutterApplicationLifeCycleDelegate>

@property (nullable, nonatomic, strong) UIWindow *window;
@property (nullable, nonatomic, strong) FlutterEngine *flutterEngine;

@end
