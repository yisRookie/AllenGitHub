//
//  CustomView.m
//  6\26
//
//  Created by 峰 on 15/6/26.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.*/
- (void)drawRect:(CGRect)rect {
    
    //    self.backgroundColor = [UIColor whiteColor];
    //---把图画上去---
    UIImage *image = [UIImage imageNamed:@"apple.png"];
    [image drawInRect:CGRectMake(-160, 400, 640, 150)];//在坐标中画出图片
    //    [image drawAtPoint:CGPointMake(100, 340)];
    
    //---直线--画
    //1.获取图形上下文
    CGContextRef ctx=UIGraphicsGetCurrentContext();
    //2.绘图（画线）
    //设置起点
    CGContextMoveToPoint(ctx, 20, 20);
    //设置终点
    CGContextAddLineToPoint(ctx, 200, 300);
    //渲染
    CGContextStrokePath(ctx);
    
    //---画圆---实心圆
    //--A--
    UIBezierPath* p = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0,200,100,100)];
    
    [[UIColor blueColor] setFill];
    
    [p fill];
    
    //--B--
    CGContextRef con = UIGraphicsGetCurrentContext();
    
    CGContextAddEllipseInRect(con, CGRectMake(0,100,100,100));
    
    CGContextSetFillColorWithColor(con, [UIColor blueColor].CGColor);
    
    CGContextFillPath(con);
    
    
    //2.b画一个圆
    //2.b.1创建一条画圆的绘图路径(注意这里是可变的，不是CGPathRef)
    CGMutablePathRef path1=CGPathCreateMutable();
    
    //2.b.2把圆的绘图信息添加到路径里
    CGPathAddEllipseInRect(path1, NULL, CGRectMake(50, 50, 100, 100));
    
    //2.b.3把圆的路径添加到图形上下文中
    CGContextAddPath(ctx, path1);
    
    
    //3.渲染
    CGContextStrokePath(ctx);
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
}
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
    
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
}



@end
