//
//  UIButton+countDown.h
//  NetworkEgOc
//
//  Created by iosdev on 15/3/17.
//  Copyright (c) 2015年 iosdev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (CountDown)
/**
 *  @brief  倒计时Button
 *
 *  @param timeout    时间
 *  @param tittle     title
 *  @param waitTittle waitTittle description
 */
-(void)startTime:(NSInteger )timeout title:(NSString *)tittle waitTittle:(NSString *)waitTittle;
@end
