//
//  ViewController.m
//  RemotePushDemo
//
//  Created by student似水流年 on 16/5/25.
//  Copyright © 2016年 andli. All rights reserved.
//

#import "ViewController.h"
#import "JPUSHService.h"
#import "AppDelegate.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //TODO: 推送数量初始化
    _messageCount = 0;
    
    //TODO: 通知数量初始化
    _notificationCount = 0;
    
    //TODO:通知内容数组
    _messageContents = [[NSMutableArray alloc] initWithCapacity:6];
    
    //TODO: 通知中心注册监听网络连接状态
    NSNotificationCenter *defaultCenter = [NSNotificationCenter defaultCenter];
    
    //TODO: 建立连接
    [defaultCenter addObserver:self
                      selector:@selector(networkDidSetup:)
                          name:kJPFNetworkDidSetupNotification
                        object:nil];
    //TODO: 关闭连接
    [defaultCenter addObserver:self
                      selector:@selector(networkDidClose:)
                          name:kJPFNetworkDidCloseNotification
                        object:nil];
    //TODO: 注册成功
    [defaultCenter addObserver:self
                      selector:@selector(networkDidRegister:)
                          name:kJPFNetworkDidRegisterNotification
                        object:nil];
    //TODO: 登录成功
    [defaultCenter addObserver:self
                      selector:@selector(networkDidLogin:)
                          name:kJPFNetworkDidLoginNotification
                        object:nil];
    //TODO: 收到消息
    [defaultCenter addObserver:self
                      selector:@selector(networkDidReceiveMessage:)
                          name:kJPFNetworkDidReceiveMessageNotification
                        object:nil];
    //TODO: 错误提示
    [defaultCenter addObserver:self
                      selector:@selector(serviceError:)
                          name:kJPFServiceErrorNotification
                        object:nil];

}

#pragma mark-----------------dealloc方法里面释放通知
- (void)dealloc {
    [self unObserveAllNotifications];
}

- (void)unObserveAllNotifications {
    NSNotificationCenter *defaultCenter = [NSNotificationCenter defaultCenter];
    [defaultCenter removeObserver:self
                             name:kJPFNetworkDidSetupNotification
                           object:nil];
    [defaultCenter removeObserver:self
                             name:kJPFNetworkDidCloseNotification
                           object:nil];
    [defaultCenter removeObserver:self
                             name:kJPFNetworkDidRegisterNotification
                           object:nil];
    [defaultCenter removeObserver:self
                             name:kJPFNetworkDidLoginNotification
                           object:nil];
    [defaultCenter removeObserver:self
                             name:kJPFNetworkDidReceiveMessageNotification
                           object:nil];
    [defaultCenter removeObserver:self
                             name:kJPFServiceErrorNotification
                           object:nil];
}
#pragma mark-------------------------------网络建立连接
- (void)networkDidSetup:(NSNotification *)notification {
    NSLog(@"已连接");
}
#pragma mark-------------------------------网络关闭连接
- (void)networkDidClose:(NSNotification *)notification {
    NSLog(@"未连接");
}
#pragma mark-------------------------------注册成功
- (void)networkDidRegister:(NSNotification *)notification {
    NSLog(@"%@", [[notification userInfo] valueForKey:@"RegistrationID"]);
    NSLog(@"已注册");
}
#pragma mark-------------------------------登录成功
- (void)networkDidLogin:(NSNotification *)notification {
    NSLog(@"已登录");
    if ([JPUSHService registrationID]) {
        NSLog(@"get RegistrationID");
    }
}
#pragma mark-------------------------------接收消息
- (void)networkDidReceiveMessage:(NSNotification *)notification {
    NSDictionary *userInfo = [notification userInfo];
    NSString *title = [userInfo valueForKey:@"title"];
    NSString *content = [userInfo valueForKey:@"content"];
    NSDictionary *extra = [userInfo valueForKey:@"extras"];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
    
    NSString *currentContent = [NSString   stringWithFormat:
      @"收到自定义消息:%@\ntitle:%@\ncontent:%@\nextra:%@\n",
                                [NSDateFormatter localizedStringFromDate:[NSDate date]
                                                               dateStyle:NSDateFormatterNoStyle
                                                               timeStyle:NSDateFormatterMediumStyle],
                                title, content, [self logDic:extra]];
    NSLog(@"%@", currentContent);
    
    [_messageContents insertObject:currentContent atIndex:0];
    _messageCount++;
}

// log NSSet with UTF8
// if not ,log will be \Uxxx
- (NSString *)logDic:(NSDictionary *)dic {
    if (![dic count]) {
        return nil;
    }
    NSString *tempStr1 =
    [[dic description] stringByReplacingOccurrencesOfString:@"\\u"
                                                 withString:@"\\U"];
    NSString *tempStr2 =
    [tempStr1 stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""];
    NSString *tempStr3 =
    [[@"\"" stringByAppendingString:tempStr2] stringByAppendingString:@"\""];
    NSData *tempData = [tempStr3 dataUsingEncoding:NSUTF8StringEncoding];
    NSString *str =
    [NSPropertyListSerialization propertyListFromData:tempData
                                     mutabilityOption:NSPropertyListImmutable
                                               format:NULL
                                     errorDescription:NULL];
    return str;
}
#pragma mark-------------------------------接收错误消息
- (void)serviceError:(NSNotification *)notification {
    NSDictionary *userInfo = [notification userInfo];
    NSString *error = [userInfo valueForKey:@"error"];
    NSLog(@"%@", error);
}

- (void)addNotificationCount {
    _notificationCount++;
}

- (void)addMessageCount {
    _messageCount++;
}


- (void)cleanMessage:(id)sender {
    _messageCount = 0;
    _notificationCount = 0;
    [_messageContents removeAllObjects];
}
#pragma mark-------------视图将要出现
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
#pragma mark-------------视图将要消失
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
