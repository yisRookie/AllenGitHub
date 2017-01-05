//
//  ViewController.m
//  DrawTestDemo
//
//  Created by 峰 on 15/7/3.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import "ViewController.h"
#import "PointView.h"
#import "MiFMPointView.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(158, 300, 2, 30)];
//    [self setTransform:3*(M_PI/180) forLable:label1];
//    label1.backgroundColor = [UIColor redColor];
//    [self.view addSubview: label1];
//    
//    
//    UILabel *label2 =[[UILabel alloc]initWithFrame:CGRectMake(160, 300, 2, 40)];
//    
//    label2.backgroundColor = [UIColor blackColor];
//   
//    [self.view addSubview: label2];
//    
////    label2.transform=CGAffineTransformMakeRotation(M_PI/2);
//    [self setTransform:45*M_PI/180 forLable:label2];
    
//    PointView *pointV = [[PointView alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
//    
//    [self.view addSubview:pointV];
    self.view.backgroundColor = [UIColor grayColor];
        MiFMPointView *point = [[MiFMPointView alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
        [self.view addSubview:point];
    
//    UIImageView *imageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 100, 320, 20)];
//    [self.view addSubview:imageView1];
//    
//    
//    UIGraphicsBeginImageContext(imageView1.frame.size);   //开始画线
//    [imageView1.image drawInRect:CGRectMake(0, 0, imageView1.frame.size.width, imageView1.frame.size.height)];
//    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);  //设置线条终点形状
//    CGContextSetLineJoin(UIGraphicsGetCurrentContext(), kCGLineJoinRound);
//    
//    CGFloat lengths[2] = {10,3};
//    CGContextRef line = UIGraphicsGetCurrentContext();
//    CGContextSetStrokeColorWithColor(line, [UIColor redColor].CGColor);
//    
//    CGContextSetLineDash(line, 0, lengths, 3);  //画虚线
//    CGContextMoveToPoint(line, 0.0, 20.0);    //开始画线
//    CGContextAddLineToPoint(line, 310.0, 20.0);
//    CGContextStrokePath(line);
//    
//    imageView1.image = UIGraphicsGetImageFromCurrentImageContext();
    
}

-(void)setTransform:(float) radians forLable:(UIView *) view
{
    view.transform = CGAffineTransformMakeRotation(radians);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
