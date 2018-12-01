/*
 Licensed to the Apache Software Foundation (ASF) under one
 or more contributor license agreements.  See the NOTICE file
 distributed with this work for additional information
 regarding copyright ownership.  The ASF licenses this file
 to you under the Apache License, Version 2.0 (the
 "License"); you may not use this file except in compliance
 with the License.  You may obtain a copy of the License at

 http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing,
 software distributed under the License is distributed on an
 "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 KIND, either express or implied.  See the License for the
 specific language governing permissions and limitations
 under the License.
 */

//
//  AppDelegate.h
//  AnywideApp
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright ___ORGANIZATIONNAME___ ___YEAR___. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Cordova/CDVViewController.h>

// 微信支付插件
#import "WXApi.h"

@class CDVHXPay;

@interface AppDelegate : NSObject <UIApplicationDelegate,
    UIAlertViewDelegate,            // 微信支付
    WXApiDelegate                   // 微信支付
>
{
    enum WXScene _scene;
}

// invoke string is passed to your app on launch, this is only valid if you
// edit AnywideApp-Info.plist to add a protocol
// a simple tutorial can be found here :
// http://iphonedevelopertips.com/cocoa/launching-your-own-application-via-a-custom-url-scheme.html

@property (nonatomic, strong) IBOutlet UIWindow* window;
@property (nonatomic, strong) IBOutlet CDVViewController* viewController;

// 发起微信支付
- (void)sendPay_demo:(NSString*)totalFee:(NSString*)body:(NSString*)detail:(NSString*)outTradeNo:(NSString*)notifyUrl;

// 设置恒讯微信支付回调
+(void)setWeiChatJsDelegate:(CDVHXPay*)cdvHXpay:(CDVInvokedUrlCommand*)comDelegate;

@end
