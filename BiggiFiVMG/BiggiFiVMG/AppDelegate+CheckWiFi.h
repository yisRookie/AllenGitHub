//
//  AppDelegate+CheckWiFi.h
//  BiggiFiVMG
//
//  Created by 峰 on 15/6/9.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import "AppDelegate.h"


@interface AppDelegate (CheckWiFi)


-(void)checkCurrentWiFiWithBlock:(void (^)())inWiFiNetWork;

@end
