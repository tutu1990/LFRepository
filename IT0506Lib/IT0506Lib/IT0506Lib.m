//
//  IT0506Lib.m
//  IT0506Lib
//
//  Created by student似水流年 on 16/5/31.
//  Copyright © 2016年 andli. All rights reserved.
//

#import "IT0506Lib.h"

@implementation IT0506Lib


-(int)sum:(int)a  :(int)b {

    return a+b;

}

+(void)printLog {
    NSLog(@"This is a print log method!!!!");
}


-(UIImage *)getName:(NSString *)name {

    NSString *path = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"libsource.bundle"];
    
    NSAssert(path, @"path is null");
    
    NSString *imagePath = [path stringByAppendingPathComponent:name];
    
    
    NSAssert(imagePath, @"image is null");//断言，imagepath不存在，打印@"image is null"，同时不执行下面的代码
    
    
    return [UIImage imageWithContentsOfFile:imagePath];

}






-(UIView *)customViewWithImageName:(NSString *)imageName{
    UIImage *image = [self getName:imageName];
    UIImageView *imageV = [[UIImageView alloc]initWithFrame:CGRectMake(2, 2, 296, 200)];
    imageV.image = image;
    
    
    
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 300, 300)];
    bgView.backgroundColor = [UIColor brownColor];
    [bgView addSubview:imageV];
    return bgView;
}




@end
