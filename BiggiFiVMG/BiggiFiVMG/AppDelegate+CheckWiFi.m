//
//  AppDelegate+CheckWiFi.m
//  BiggiFiVMG
//
//  Created by 峰 on 15/6/9.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import "AppDelegate+CheckWiFi.h"
#import "Reachability.h"

@implementation AppDelegate (CheckWiFi)

-(void)checkCurrentWiFiWithBlock:(void (^)())inWiFiNetWork{
    
    Reachability* reach = [Reachability reachabilityForLocalWiFi];
    [reach startNotifier];
    
    
    if (!reach.isReachableViaWiFi) {
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"您当前没有连接WIFI网络" delegate:self cancelButtonTitle:@"知道了" otherButtonTitles:nil, nil];
        [alert show];
        DDLog(@"没有网络");
        return ;
    }
    
    reach.reachableBlock = ^(Reachability * reachability)
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if ([reachability currentReachabilityStatus]==ReachableViaWiFi) {

                FDAlertView *alert = [[FDAlertView alloc] initWithTitle:@"温馨提示" icon:[UIImage imageNamed:@"exclamation-icon"] message:@"您现在网络环境为wifi！" delegate:nil buttonTitles:@"确定", nil];
                
                [alert show];
            }else{

                FDAlertView *alert = [[FDAlertView alloc] initWithTitle:@"温馨提示" icon:nil message:@"您现在不是wifi" delegate:nil buttonTitles:@"确定", nil];
                [alert show];
                
                
            }
        });
    };
    
    reach.unreachableBlock = ^(Reachability * reachability)
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:@"您现在不是wifi！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alert show];
        });
    };
    
}

@end
