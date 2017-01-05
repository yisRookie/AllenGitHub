//
//  BezierV.h
//  DrawTestDemo
//
//  Created by 峰 on 15/7/3.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#define PI 3.14159265358979323846
enum RotateDirection{
    CLOCK,
    ANTICLOCK
} ;
@interface BezierV : UIView{

    /*d当前转动的方向*/
    enum RotateDirection currentRotateDirection;
    
    CGPoint touchStartPoint , touchEndPoint ;
    

}

//@property (nonatomic, assign)  CGPath startPath;
//@property (nonatomic, assign)  CGPath endPath;
@property (nonatomic, strong) CAShapeLayer *pathLayer;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic , assign) double moveAngle;

@property (nonatomic , strong) UIView *gaugerView;
@end
