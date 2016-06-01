//
//  AppDelegate.h
//  RemotePushDemo
//
//  Created by student似水流年 on 16/5/25.
//  Copyright © 2016年 andli. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  获取appKey
 */
static NSString *appKey = @"5de7a33c9f898474e1cb7982";
/**
 *  选取发送的频道(对象)
 */
static NSString *channel = @"Publish channel";


/**
 * 是否发送
 */
static BOOL isProduction = FALSE;


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;


@end

