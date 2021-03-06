//
//  UIView+SnapShot.m
//  HSFolderCellDemo
//
//  Created by He Shun on 2018/3/6.
//  Copyright © 2018年 He Shun. All rights reserved.
//

#import "UIView+SnapShot.h"

@implementation UIView (SnapShot)

- (UIImage *)takeSnapShot:(CGRect)frame{
    UIGraphicsBeginImageContextWithOptions(frame.size, NO, 0);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    if(context == nil){
        return nil;
    }
    
    //根据x和y进行平移，x为正时往右移，y为正时往上移动
    CGContextTranslateCTM(context, -frame.origin.x, -frame.origin.y);
    
    [self.layer renderInContext:context];
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
