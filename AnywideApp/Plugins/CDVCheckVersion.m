//
//  CDVCheckVersion.m
//  
//
//  Created by zdx on 16/1/12.
//
//
#import <Foundation/Foundation.h>
#import "CDVCheckVerison.h"
#import <Cordova/CDVViewController.h>
#import <Cordova/CDVScreenOrientationDelegate.h>


@implementation CDVCheckVersion

static NSString* url;

//获取版本号
-(void) getVersion:(CDVInvokedUrlCommand *) command
{
//    CDVPluginResult* pluginResult = nil;
//    NSString* echo = [command.arguments objectAtIndex:0];
//    
//    if (echo != nil && [echo length] > 0)
//    {
//        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:echo];
//    }
//    else
//    {
//        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
//    }
//    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];

    NSString* value0 = [NSString stringWithFormat:@"%@", [[[NSBundle mainBundle] infoDictionary] valueForKey:@"CFBundleShortVersionString"] ];
    
//    NSString *executableFile = [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleExecutableKey];    //获取项目名称
//    
//    NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleVersionKey];      //获取项目版本号
//    
//    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
//    // app名称
//    NSString *app_Name = [infoDictionary objectForKey:@"CFBundleDisplayName"];
//    // app版本
//    NSString *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
//    // app build版本
//    NSString *app_build = [infoDictionary objectForKey:@"CFBundleVersion"];
    
    CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:value0];
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}

//检查更新
-(void) checkVersion:(CDVInvokedUrlCommand *) command
{
    
    NSString* value0 = [NSString stringWithFormat:@"%@", [[[NSBundle mainBundle] infoDictionary] valueForKey:@"CFBundleShortVersionString"] ];
//    NSLog(@"字符串:%@", value0);
    NSArray *currentVersionArray=[value0 componentsSeparatedByString:@"."];
    // 解析js回调字典
    NSDictionary* dic = [command argumentAtIndex:0 withDefault:@"{}"];
    
    NSString* latestVersion = [dic objectForKey:@"latestVersion"];
    url = [dic objectForKey:@"url"];
    NSString* isForceUpdate = [dic objectForKey:@"isForceUpdate"];
    
//    NSLog(@"latestVersion:%@", latestVersion);
//    NSLog(@"url:%@", url);
    NSLog(@"isForceUpdate:%@", isForceUpdate);
    
    NSArray *latestVersionArray=[latestVersion componentsSeparatedByString:@"."];
    
    BOOL haveNewVersion = false;
    
    for (int i=0; i<[latestVersionArray count]; i++) {
        if ([[latestVersionArray objectAtIndex:i] intValue] > [[currentVersionArray objectAtIndex:i] intValue]) {
            UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"更新提示" message:@"检测到新版本，快去更新吧~" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"更新",nil];
            haveNewVersion = true;
            [alert show];
            break;
        }
    }
    if(!haveNewVersion && [isForceUpdate isEqual: @"true"]){
        UIAlertView*alert = [[UIAlertView alloc]initWithTitle:@"更新提示"
                                                      message:@"没有新版本，再等等吧~"
                                                     delegate:nil
                                            cancelButtonTitle:@"确定"
                                            otherButtonTitles:nil];
        [alert show];
    }
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 1) {
//        NSLog(@"test");
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString: url]];
    }
}

@end