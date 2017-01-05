//
//  BiggiFICategory.h
//  BiggiFiVMG
//
//  Created by 峰 on 15/6/9.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Reachability.h"

@interface BiggiFICategory : NSObject


@property (nonatomic, strong) Reachability *reachability;



/**
 *  获取当前的网络制式
 *
 *  @return wifi、4g、3g、2g
 */
+ (NSString *)getNetWorkStates;

/**
 *  获取当前的wifi名字 
 */
+ (id)fetchSSIDInfomation;

/**
 *  强制竖屏
 */
+ (void)setDevicePortrait;

/**
 *  强制横屏
 */
+ (void)setDeviceLanLandscape;


/**
 * @brief 把对象（Model）转换成字典
 * @param model 模型对象
 * @return 返回字典
 */
+ (NSDictionary *)dictionaryWithModel:(id)model;

/**
 * @brief 获取Model的所有属性名称
 * @param model 模型对象
 * @return 返回模型中的所有属性值
 */
+ (NSArray *)propertiesInModel:(id)model;

/**
 * @brief 把字典转换成模型，模型类名为className
 * @param dict 字典对象
 * @param className 类名
 * @return 返回数据模型对象
 */
+ (id)modelWithDict:(NSDictionary *)dict className:(NSString *)className;


@end
