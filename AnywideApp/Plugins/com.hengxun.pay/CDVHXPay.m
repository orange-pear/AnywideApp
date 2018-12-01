//
//  CDVHXPay.m
//  AnywideApp
//
//  Created by 恒迅华成 on 15/9/17.
//
//

#import "CDVHXPay.h"
#import "WXUtil.h"

static AppDelegate* _delegate = nil;

@implementation CDVHXPay

// 静态的AppDelegate
+(void)setDelegate:(AppDelegate*)delegate
{
    _delegate = delegate;
}

- (NSString*)genOutTradeNo
{
    NSString *time_stamp;
    
    //设置支付参数
    time_t now;
    time(&now);
    time_stamp  = [NSString stringWithFormat:@"%ld", now];
    return [WXUtil md5:time_stamp];
}

// 微信支付
- (void)payWeChat:(CDVInvokedUrlCommand*)command
{
    /*
     body = "\U6211\U662fbody";     // 商品名
     detail = "\U6211\U662fdetail"; // 详细商品介绍
     notifyUrl = "notifyUrl:";      // 微信服务器回调地址
     outTradeNo = "outTradeNo:";    // 货号
     totalFee = 9999999;            // 金额
     */
    
    // 解析js回调字典
    NSDictionary* dic = [command argumentAtIndex:0 withDefault:@"{}"];
    
    NSString* body          = [dic objectForKey:@"body"];
    NSString* detail        = [dic objectForKey:@"detail"];
    NSString* notifyUrl     = [dic objectForKey:@"notifyUrl"];
    NSString* outTradeNo    = [dic objectForKey:@"outTradeNo"];
    NSNumber* totalFee      = [dic objectForKey:@"totalFee"];
    

    /*
    // 反馈参数
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"调用成功"];
    
    // 反馈给js
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    */
    
    [AppDelegate setWeiChatJsDelegate:self :command];
    
    //- ( NSMutableDictionary *)sendPay_demo:(NSString*)totalFee:(NSString*)body:(NSString*)detail:(NSString*)outTradeNo:(NSString*)notifyUrl
    [_delegate sendPay_demo:[totalFee stringValue] :body :detail :[self genOutTradeNo] :notifyUrl];
    
}

@end
