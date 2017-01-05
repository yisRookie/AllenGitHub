//
//  NavRootVC.m
//  BiggiFiVMG
//
//  Created by 峰 on 15/6/10.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import "NavRootVC.h"
#import "SearchVC.h"
#import "MainControlVC.h"
#import "SettingsVC.h"


@interface NavRootVC ()

@end

@implementation NavRootVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //修改navBar 的颜色
    [[UINavigationBar appearance] setBackgroundImage:[self imageWithColor:RGBA(200, 200, 200, 1)] forBarMetrics:UIBarMetricsDefault];
    
 
    
}

- (UIImage*) imageWithColor:(UIColor*)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (BOOL)shouldAutorotate
{
    
    return YES;
}

//- (NSUInteger)supportedInterfaceOrientations
//{
//    
//    
//    
//    if ([self.topViewController isKindOfClass:[SearchVC class]]) {
//        
//        return UIInterfaceOrientationMaskPortrait;
//        
//    }
//    else if([self.topViewController isKindOfClass:[MainControlVC class]]){
//         
//        return  UIInterfaceOrientationMaskLandscape;
//        
//    }else if([self.topViewController isKindOfClass:[SettingsVC class]]){
//         
//        return  UIInterfaceOrientationMaskLandscape;
//    }
//    
//    return  UIInterfaceOrientationMaskPortrait;
//}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
