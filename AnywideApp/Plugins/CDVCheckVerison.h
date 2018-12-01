//
//  CDVEcho.h
//  AnywideApp
//
//  Created by zdx on 16/1/12.
//
//

#import <UIKit/UIKit.h>
#import <Cordova/CDVPlugin.h>

@interface CDVCheckVersion : CDVPlugin<UIAlertViewDelegate>

//实例方法
-(void) checkVersion:(CDVInvokedUrlCommand *) command;
@end