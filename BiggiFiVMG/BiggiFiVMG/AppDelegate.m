//
//  AppDelegate.m
//  BiggiFiVMG
//
//  Created by 峰 on 15/6/9.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+CheckWiFi.h"
#import "SearchVC.h"
#import "SettingManagement.h"

@interface AppDelegate ()

@end




@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [UIApplication sharedApplication].idleTimerDisabled=YES;//防止锁屏
    
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    [self.window makeKeyAndVisible];
    self.window.backgroundColor = [UIColor whiteColor];
    
    [self checkCurrentWiFiWithBlock:^{
        
    }];
    
    //首次设置默认值
    
    if (![[NSUserDefaults standardUserDefaults] boolForKey:@"everLaunched"]) {
        
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"everLaunched"];
        
        [self registAllDefaultValues];
        
    }
    SearchVC *search = [[SearchVC alloc]init];
    
    UINavigationController *rootVC = [[UINavigationController alloc]initWithRootViewController:search];
    rootVC.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"back"]];
    
    self.window.rootViewController= rootVC;
    
    UIImage *imageAA = [UIImage imageNamed:@"back"];
    NSLog(@"1111111111  image:%@",imageAA);
    
    return YES;
}
- (void)registAllDefaultValues
{
    NSMutableDictionary *defaultValues = [NSMutableDictionary dictionary];
    [defaultValues setObject:@"3" forKey:@"TouchRate"];
    [defaultValues setObject:@"1" forKey:@"IsFirstLoading"];
    [defaultValues setObject:@"0" forKey:@"OperateMode"];
    [[NSUserDefaults standardUserDefaults] setObject:defaultValues forKey:@"AllDefaultKey"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}



- (void)applicationWillResignActive:(UIApplication *)application {
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
}

- (void)applicationWillEnterForeground:(UIApplication *)application {

}

- (void)applicationDidBecomeActive:(UIApplication *)application {

}

- (void)applicationWillTerminate:(UIApplication *)application {
}

@end
