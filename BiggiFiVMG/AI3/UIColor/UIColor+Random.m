//
//  UIColor+Random.m
//  BiggiFiVMG
//
//  Created by 峰 on 15/7/22.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import "UIColor+Random.h"

@implementation UIColor (Random)
+ (UIColor *)RandomColor{

    NSInteger aRedValue = arc4random() % 255;
    NSInteger aGreenValue = arc4random() % 255;
    NSInteger aBlueValue = arc4random() % 255;
    UIColor *randColor = [UIColor colorWithRed:aRedValue / 255.0f green:aGreenValue / 255.0f blue:aBlueValue / 255.0f alpha:1.0f];
    return randColor;
}
@end


