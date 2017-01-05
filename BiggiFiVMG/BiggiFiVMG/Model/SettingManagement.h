//
//  SettingManagement.h
//  BiggiFiVMG
//
//  Created by 峰 on 15/6/18.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SettingManagement : NSObject

@property(nonatomic,strong) NSMutableDictionary *setDic;

+ (SettingManagement *)instance;

- (void)updateList;
- (void)readPlist;

@end
