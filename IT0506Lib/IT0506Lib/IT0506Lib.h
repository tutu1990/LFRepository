//
//  IT0506Lib.h
//  IT0506Lib
//
//  Created by student似水流年 on 16/5/31.
//  Copyright © 2016年 andli. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface IT0506Lib : NSObject


@property (nonatomic,strong) NSString *name;

/**
 *  求和
 *
 *  @param a <#a description#>
 *  @param b <#b description#>
 *
 *  @return <#return value description#>
 */
-(int)sum:(int)a  :(int)b;

+(void)printLog;


/**
 *  设置图片
 *
 *  @param imageName <#imageName description#>
 *
 *  @return <#return value description#>
 */
-(UIView *)customViewWithImageName:(NSString *)imageName;







@end
