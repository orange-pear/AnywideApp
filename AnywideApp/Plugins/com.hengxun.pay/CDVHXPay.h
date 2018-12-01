//
//  CDVHXPay.h
//  AnywideApp
//
//  Created by 田伟汉 on 15/9/17.
//
//  恒讯支付插件

#import <UIKit/UIKit.h>
#import <Cordova/CDVPlugin.h>

#import "AppDelegate.h"

@interface CDVHXPay : CDVPlugin
{
    
}

// 静态的AppDelegate
+(void)setDelegate:(AppDelegate*)delegate;

// 微信支付
- (void)payWeChat:(CDVInvokedUrlCommand*)command;


@end