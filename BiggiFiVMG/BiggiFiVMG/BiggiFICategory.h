//
//  BiggiFICategory.h
//  BiggiFiVMG
//
//  Created by 峰 on 15/6/9.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BiggiFICategory : NSObject
/**
 *  获取当前的网络制式
 *
 *  @return wifi、4g、3g、2g
 */
+(NSString *)getNetWorkStates;

/**
 *  获取当前的wifi名字
 */
+(id)fetchSSIDInfomation;

@end
