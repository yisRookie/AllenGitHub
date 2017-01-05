//
//  ViewController.m
//  6\26
//
//  Created by 峰 on 15/6/26.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import "ViewController.h"
#import "CustomView.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CustomView *customView = [[CustomView alloc]initWithFrame:CGRectMake(0, 0, 320, 568)];
    customView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:customView];
    

}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
