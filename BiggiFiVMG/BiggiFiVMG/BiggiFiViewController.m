//
//  BiggiFiViewController.m
//  BiggiFiVMG
//
//  Created by 峰 on 15/7/28.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import "BiggiFiViewController.h"

@interface BiggiFiViewController ()

@end

@implementation BiggiFiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *backImage = [UIImage imageNamed:@"back"];
    
    self.view.layer.contents = (id) backImage.CGImage;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
