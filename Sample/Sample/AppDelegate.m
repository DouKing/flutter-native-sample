//
// Sample
// AppDelegate.m
//
// Created by wuyikai on 2020/2/4.
// Copyright © 2020 wuyikai. All rights reserved.
// 

#import "AppDelegate.h"

@interface AppDelegate ()

@property (nullable, nonatomic, strong) FlutterPluginAppLifeCycleDelegate *lifeCycleDelegate;

@end

@implementation AppDelegate

- (instancetype)init {
    self = [super init];
    if (self) {
        _lifeCycleDelegate = [[FlutterPluginAppLifeCycleDelegate alloc] init];
    }
    return self;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.flutterEngine = [[FlutterEngine alloc] initWithName:@"io.flutter" project:nil];
    [self.flutterEngine runWithEntrypoint:nil];
    [GeneratedPluginRegistrant registerWithRegistry:self.flutterEngine];
    return [_lifeCycleDelegate application:application didFinishLaunchingWithOptions:launchOptions];
}

// 返回 key window 的 rootViewController, 如果它是一个 FlutterViewController
// Otherwise, returns nil.
- (FlutterViewController*)rootFlutterViewController {
    UIViewController* viewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    if ([viewController isKindOfClass:[FlutterViewController class]]) {
        return (FlutterViewController*)viewController;
    }
    return nil;
}

- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {
    [super touchesBegan:touches withEvent:event];
    // 传递状态栏的点击到 key window 上 Flutter 的 rootViewController
    if (self.rootFlutterViewController != nil) {
        [self.rootFlutterViewController handleStatusBarTouches:event];
    }
}

//- (void)application:(UIApplication*)application
//didRegisterUserNotificationSettings:(UIUserNotificationSettings*)notificationSettings {
//    [_lifeCycleDelegate application:application
//didRegisterUserNotificationSettings:notificationSettings];
//}

- (void)application:(UIApplication*)application
didRegisterForRemoteNotificationsWithDeviceToken:(NSData*)deviceToken {
    [_lifeCycleDelegate application:application
didRegisterForRemoteNotificationsWithDeviceToken:deviceToken];
}

- (void)application:(UIApplication*)application
didReceiveRemoteNotification:(NSDictionary*)userInfo
fetchCompletionHandler:(void (^)(UIBackgroundFetchResult result))completionHandler {
    [_lifeCycleDelegate application:application
       didReceiveRemoteNotification:userInfo
             fetchCompletionHandler:completionHandler];
}

- (BOOL)application:(UIApplication*)application
            openURL:(NSURL*)url
            options:(NSDictionary<UIApplicationOpenURLOptionsKey, id>*)options {
    return [_lifeCycleDelegate application:application openURL:url options:options];
}

//- (BOOL)application:(UIApplication*)application handleOpenURL:(NSURL*)url {
//    return [_lifeCycleDelegate application:application handleOpenURL:url];
//}
//
//- (BOOL)application:(UIApplication*)application
//            openURL:(NSURL*)url
//  sourceApplication:(NSString*)sourceApplication
//         annotation:(id)annotation {
//    return [_lifeCycleDelegate application:application
//                                   openURL:url
//                         sourceApplication:sourceApplication
//                                annotation:annotation];
//}

- (void)application:(UIApplication*)application
performActionForShortcutItem:(UIApplicationShortcutItem*)shortcutItem
  completionHandler:(void (^)(BOOL succeeded))completionHandler NS_AVAILABLE_IOS(9_0) {
    [_lifeCycleDelegate application:application
       performActionForShortcutItem:shortcutItem
                  completionHandler:completionHandler];
}

- (void)application:(UIApplication*)application
handleEventsForBackgroundURLSession:(nonnull NSString*)identifier
  completionHandler:(nonnull void (^)(void))completionHandler {
    [_lifeCycleDelegate application:application
handleEventsForBackgroundURLSession:identifier
                  completionHandler:completionHandler];
}

//- (void)application:(UIApplication*)application
//performFetchWithCompletionHandler:(void (^)(UIBackgroundFetchResult result))completionHandler {
//    [_lifeCycleDelegate application:application performFetchWithCompletionHandler:completionHandler];
//}

- (void)addApplicationLifeCycleDelegate:(NSObject<FlutterPlugin>*)delegate {
    [_lifeCycleDelegate addDelegate:delegate];
}

@end
