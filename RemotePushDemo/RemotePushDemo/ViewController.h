//
//  ViewController.h
//  RemotePushDemo
//
//  Created by student似水流年 on 16/5/25.
//  Copyright © 2016年 andli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController  {
    NSMutableArray *_messageContents;
    int _messageCount;
    int _notificationCount;
}

- (void)addNotificationCount;


- (void)cleanMessage:(id)sender;







@end

