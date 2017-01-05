//
//  BiggiFICategory.m
//  BiggiFiVMG
//
//  Created by 峰 on 15/6/9.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import "BiggiFICategory.h"
#import "AppDelegate.h"
#import <SystemConfiguration/CaptiveNetwork.h>
#include <arpa/inet.h>
#include <net/if.h>
#include <ifaddrs.h>

@implementation BiggiFICategory

+(NSString *)getNetWorkStates{
    UIApplication *app = [UIApplication sharedApplication];
    NSArray *children = [[[app valueForKeyPath:@"statusBar"]valueForKeyPath:@"foregroundView"]subviews];
    NSString *state = [[NSString alloc]init];
    int netType = 0;
    //获取到网络返回码
    for (id child in children) {
        if ([child isKindOfClass:NSClassFromString(@"UIStatusBarDataNetworkItemView")]) {
            //获取到状态栏
            netType = [[child valueForKeyPath:@"dataNetworkType"]intValue];
            
            switch (netType) {
                case 0:
                    state = @"无网络";
                    //无网模式
                    break;
                case 1:
                    state = @"2G";
                    break;
                case 2:
                    state = @"3G";
                    break;
                case 3:
                    state = @"4G";
                    break;
                case 5:
                {
                    state = @"WIFI";
                }
                    break;
                default:
                    break;
            }
        }
    }
    //根据状态选择
    return state;
}

+(id)fetchSSIDInfomation
{
    NSArray *ifs = (__bridge id)CNCopySupportedInterfaces();
    id info = nil;
    for (NSString *ifnam in ifs) {
        info = (id)CFBridgingRelease(CNCopyCurrentNetworkInfo((__bridge CFStringRef)ifnam));
        if (info && [info count]) {
            break;
        }
        
    }
    
    return info ;
}

@end
