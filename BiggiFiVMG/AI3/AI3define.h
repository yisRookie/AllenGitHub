//
//  AI3define.h
//  BiggiFiVMG
//
//  Created by 峰 on 15/6/25.
//  Copyright (c) 2015年 Allen. All rights reserved.
//


#ifndef BiggiFiVMG_AI3define_h
#define BiggiFiVMG_AI3define_h

#import "CreateModel.h"
#import "MJExtension.h"
#import "UIColor+HexString.h"
#import "UIColor+Random.h"
#import "UIButton+Block.h"
#import "UIButton+CountDown.h"
#import "UIButton+Indicator.h"
#import "UIView+Screenshot.h"
#import "CoreBtn.h"

//---RGB---颜色
#define RGBA(R/*红*/, G/*绿*/, B/*蓝*/, A/*透明*/) [UIColor colorWithRed:R/255.f green:G/255.f blue:B/255.f alpha:A]

//---DDLog---打印
#define DDLog(xx, ...)  NSLog(@"%s(%d): " xx, __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)

#endif

