//
//  BezierV.m
//  DrawTestDemo
//
//  Created by 峰 on 15/7/3.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import "BezierV.h"


@implementation BezierV


-(void)awakeFromNib{
    
    
//    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0/60 target:self selector:@selector(setNeedsDisplay) userInfo:nil repeats:YES];;
//    
//    [_timer fire];
    
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    
    
    
    [[UIColor clearColor]set];
//
//    UIRectFill([self bounds]);
    
    //拿到当前视图准备好的画板
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //利用path进行绘制三角形
    
//    CGContextBeginPath(context);//标记
//    
//    CGContextMoveToPoint(context,self.center.x/2-30, 10);//设置起点
//    
//    CGContextAddLineToPoint(context,self.center.x/2+30, 10);
//    
//    CGContextAddLineToPoint(context,self.center.x/2,10+sqrt(2700));
//    
//    CGContextClosePath(context);//路径结束标志，不写默认封闭
//    
//    [[UIColor whiteColor] setFill]; //设置填充色
//    
//    [[UIColor whiteColor] setStroke]; //设置边框颜色
//    
//    CGContextDrawPath(context,kCGPathFillStroke);//绘制路径path
    
    //    self.backgroundColor=[UIColor lightGrayColor];
    
    
//    if (_timer.isValid) {
    
//           for (int i = 0; i<4; i++) {
//               [self performSelector:@selector(benline) withObject:nil afterDelay:0.2];
//           }
//
//        UIColor *color = [UIColor whiteColor];
//        [color set]; //设置线条颜色
//        
//        UIBezierPath* aPath = [UIBezierPath bezierPath];
//        
//        aPath.lineWidth = 1.0;
//        aPath.lineCapStyle = kCGLineCapRound; //线条拐角
//        aPath.lineJoinStyle = kCGLineCapRound; //终点处理
//        
//        [aPath moveToPoint:CGPointMake(90, 200)];
//        
//        static CGFloat AA = 0;
////        static int a = 1;
//    [aPath addCurveToPoint:CGPointMake(230, 200) controlPoint1:CGPointMake(160, 200+AA) controlPoint2:CGPointMake(160, 200-AA)];
//    [aPath stroke];
//    [UIView animateWithDuration:1.0 animations:^{
//
//        [self layoutIfNeeded];
//    }];

    
//        AA+=1;
//        if (AA>=300 ) {
////            a *= -1;
//            AA = 0;
//        }
//
//                }
    
//        for (int i = 0; i<4; i++) {
//            UIColor *color = [UIColor whiteColor];
//            [color set]; //设置线条颜色
//            
//            UIBezierPath* aPath = [UIBezierPath bezierPath];
//            
//            aPath.lineWidth = 1.0;
//            aPath.lineCapStyle = kCGLineCapRound; //线条拐角
//            aPath.lineJoinStyle = kCGLineCapRound; //终点处理
//            
//            [aPath moveToPoint:CGPointMake(90, 200)];
//            [aPath addCurveToPoint:CGPointMake(230, 200) controlPoint1:CGPointMake(160, 200-10*i) controlPoint2:CGPointMake(160, 200+10*i)];
//              [aPath stroke];
//        }

//    }
//    CGContextRef context = UIGraphicsGetCurrentContext();
    //    UIColor *color = [UIColor whiteColor];
    //    [color set]; //设置线条颜色
    //
    //    UIBezierPath* aPath = [UIBezierPath bezierPath];
    //
    //    aPath.lineWidth = 1.0;
    //    aPath.lineCapStyle = kCGLineCapRound; //线条拐角
    //    aPath.lineJoinStyle = kCGLineCapRound; //终点处理
    //
    //    [aPath moveToPoint:CGPointMake(90, 200)];
    //    [aPath addCurveToPoint:CGPointMake(230, 200) controlPoint1:CGPointMake(160, 150) controlPoint2:CGPointMake(160, 250)];
    //
    //
    //       [aPath stroke];
    //
    //
    //
    //    CGContextRef context = UIGraphicsGetCurrentContext();
    //边框圆
//    CGContextSetRGBStrokeColor(context,0,0,0,1);//画笔线的颜色
//    CGContextSetLineWidth(context, 1.0);//线的宽度
//    //void CGContextAddArc(CGContextRef c,CGFloat x, CGFloat y,CGFloat radius,CGFloat startAngle,CGFloat endAngle, int clockwise)1弧度＝180°/π （≈57.3°） 度＝弧度×180°/π 360°＝360×π/180 ＝2π 弧度
//    // x,y为圆点坐标，radius半径，startAngle为开始的弧度，endAngle为 结束的弧度，clockwise 0为顺时针，1为逆时针。
//    CGContextAddArc(context, 160, 200, 124, 0, 2*PI, 0); //添加一个圆
////    CGContextDrawPath(context, kCGPathStroke); //绘制路径
//    CGContextFillPath(context);
//     CGContextFillEllipseInRect(context, CGRectMake(160-100*cosf(45*M_PI/180),200-100*sinf(45*M_PI/180), 200.0, 200));//画实心圆,参数2:圆坐标。可以是椭圆
    
    //NO.1画一条线
    
//    CGContextSetRGBStrokeColor(context, 1, 1, 1, 1);//线条颜色
//    CGContextMoveToPoint(context, 36, 200);
//    CGContextAddLineToPoint(context, 160,200);
//    CGContextStrokePath(context);
    
    
//    CGPoint star = CGPointMake(36, 200);
    
  
    
    CGPoint tmpEndPoint;
    for (int i = 0; i<180; i++) {
    CGPoint tmpPoint =CGPointMake(160-160*cosf(i*M_PI/90),  160-sinf(i*M_PI/90)*160);
        
        if (i%9==0) {
            tmpEndPoint =CGPointMake(160-130*cosf(i*M_PI/90),  160-sinf(i*M_PI/90)*130);

        }else{
    tmpEndPoint =CGPointMake(160-144*cosf(i*M_PI/90),  160-sinf(i*M_PI/90)*144);
        }
        if (i<103) {
            CGContextSetRGBStrokeColor(context, 1, 1, 1, 1);
        }else{
        CGContextSetRGBStrokeColor(context, 1, 1, 1, .5);
        }
    
    CGContextMoveToPoint(context, tmpPoint.x, tmpPoint.y);
    CGContextAddLineToPoint(context, tmpEndPoint.x,tmpEndPoint.y);
    CGContextStrokePath(context);
    }
    
//    CGContextSetRGBStrokeColor(context, 1, 1, 1, 1);//线条颜色
//    CGContextMoveToPoint(context, 230, 200);
//    CGContextAddLineToPoint(context,284,200);
//    CGContextStrokePath(context);
    
    
        //NO.8渐变
         CGContextClip(context);
         CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
         CGFloat colors[] =
         {
         204.0 / 255.0, 224.0 / 255.0, 244.0 / 255.0, 1.00,
         29.0 / 255.0, 156.0 / 255.0, 215.0 / 255.0, 1.00,
         0.0 / 255.0,  50.0 / 255.0, 126.0 / 255.0, 1.00,
         };
         CGGradientRef gradient = CGGradientCreateWithColorComponents
         (rgb, colors, NULL, sizeof(colors)/(sizeof(colors[0])*4));
         CGColorSpaceRelease(rgb);
         CGContextDrawLinearGradient(context, gradient,CGPointMake
         (0.0,0.0) ,CGPointMake(0.0,self.frame.size.height),
         kCGGradientDrawsBeforeStartLocation);
    
    /*画圆*/
    //    CGContextRef context = UIGraphicsGetCurrentContext();

    
//    [self Line];
    
//    [self benline];
//    
//    [self Abenline];
//    
//    [self Bbenline];
    
    

}

// 转动
- (void)rotate:(CGFloat)angle
{
    CGAffineTransform originTransform=self.transform ;
    //    self.imgView.transform = CGAffineTransformRotate(originTransform, angle);
    self.transform = CGAffineTransformRotate(originTransform, angle);
}

-(void)setTransform:(float) radians forLable:(UILabel *) label
{
    label.transform = CGAffineTransformMakeRotation(M_PI*radians);
}
// 计算角度
- (CGFloat)calculateAngle:(CGPoint)begin endPoint:(CGPoint)end
{
    
    CGPoint vCenter= [self center];
    
    double AB,BC,AC;
    
    AB =(begin.x - vCenter.x)*(begin.x-vCenter.x)+(begin.y-vCenter.y)*(begin.y-vCenter.y);
    
    AC = (end.x-vCenter.x)*(end.x-vCenter.x)+(end.y-vCenter.y)*(end.y-vCenter.y);
    
    BC = (begin.x - end.x)*(begin.x-end.x) +(begin.y-end.y)*(begin.y-end.y);
    
    
    self.moveAngle = acos((AB+AC-BC)/(2*sqrt(AB)*sqrt(AC)));
    
    //    if(begin.x-vCenter.x==0 ||end.x-vCenter.x == 0)
    //    {
    //        return 0.0;
    //    }
    
    CGFloat k1,k2 ;
    
    k1= (begin.y-vCenter.y)/(begin.x-vCenter.x) ;
    k2= (end.y-vCenter.y)/(end.x-vCenter.x);
    
    CGFloat tan0= (k2-k1)/(1.0+k1*k2);
    
    if(tan0>0.0)
    {
        
        
//        if (_tranfromBlock) {
//            _tranfromBlock(self.moveAngle*5);
//        }
        
    }
    else
    {
//        if (_tranfromBlock) {
//            _tranfromBlock(-self.moveAngle*5);
//        }
    }
    
    
    return self.moveAngle ;
}


//判断转动方向
- (enum RotateDirection)getRotateDirectionByPoints:(CGPoint)s end:(CGPoint)e
{
    CGFloat k1,k2 ;
    CGPoint vCenter= [self center];
    
    if(s.x-vCenter.x==0 || e.x-vCenter.x==0)
    {
        return CLOCK;
    }
    
    k1= (s.y-vCenter.y)/(s.x-vCenter.x) ;
    k2= (e.y-vCenter.y)/(e.x-vCenter.x);
    
    CGFloat tan0= (k2-k1)*(1.0+k1*k2);
    
    if(tan0>0.0)
    {
        
        return CLOCK;
    }
    else
    {
        
        return ANTICLOCK;
    }
    
}
//拖动
- (void)dragRotate:(CGPoint)s end:(CGPoint)e
{
    CGFloat angle = [self calculateAngle:touchStartPoint endPoint:touchEndPoint];
    
    currentRotateDirection=[self getRotateDirectionByPoints:s end:e];
    
    if(currentRotateDirection==ANTICLOCK)
    {
        angle=-angle ;
    }
    
    [self rotate:angle];
}

- (CGPoint) getLocationFromTouches:(NSSet*)touches
{
    UITouch *touch;
    
    for(UITouch *t in touches)
    {
        touch=t;
    }
    return [touch locationInView:self];
}

//触摸事件处理
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    touchStartPoint = [self getLocationFromTouches:touches];
    
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    
    //    [self voiceOfRotate];
    //    AudioServicesPlaySystemSound(sound_wait);
    //
//    self.avAudioPlayer.volume = 1;
//    [self playVocie];
    //    NSString *path1 = [[NSBundle mainBundle] pathForResource:@"dial_voice" ofType:@"wav"];
    //
    //    AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath:path1],&sound_wait);
    //
    //    CGFloat distance = [self getDistance:touchStartPoint end:touchEndPoint];
    
    //    if(distance > 1.0)
    //    {
    
    //    }
    touchEndPoint = [self getLocationFromTouches:touches];
    [self dragRotate:touchStartPoint end:touchEndPoint];
    touchStartPoint = touchEndPoint ;
    
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
//    AudioServicesDisposeSystemSoundID(sound_wait);
    
}
- (CGFloat) getDistance:(CGPoint)s end:(CGPoint)e
{
    return sqrt((s.x-e.x)*(s.x-e.x) + (s.y-e.y)*(s.y-e.y));
}


//直线
- (void)Line{
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetRGBStrokeColor(context, 0.5, 0.5, 0.5, 0.5);//线条颜色
    CGContextMoveToPoint(context, 90, 200);
    CGContextAddLineToPoint(context, 230,200);
    CGContextStrokePath(context);
    
    
}

//quxian
- (void)benline{
    
    if (_timer.isValid) {
    UIColor *color = [UIColor whiteColor];
    [color set]; //设置线条颜色
    
    UIBezierPath* aPath = [UIBezierPath bezierPath];
    
    aPath.lineWidth = .75;
    aPath.lineCapStyle = kCGLineCapRound; //线条拐角
    aPath.lineJoinStyle = kCGLineCapRound; //终点处理
    
    [aPath moveToPoint:CGPointMake(90, 200)];
    
    static CGFloat AA = 0;
    static int a = 1;
    [aPath addCurveToPoint:CGPointMake(230, 200) controlPoint1:CGPointMake(160, 200+AA) controlPoint2:CGPointMake(160, 200-AA)];
    [aPath stroke];
    AA+=.75*a;
    if (AA>=45 || AA<=0) {
        a *= -1;
    }
        
    }
}
- (void)Abenline{
    
    if (_timer.isValid) {
        UIColor *color = [UIColor whiteColor];
        [color set]; //设置线条颜色
        
        UIBezierPath* aPath = [UIBezierPath bezierPath];
        
        aPath.lineWidth = .5;
        aPath.lineCapStyle = kCGLineCapRound; //线条拐角
        aPath.lineJoinStyle = kCGLineCapRound; //终点处理
        
        [aPath moveToPoint:CGPointMake(90, 200)];
        
        static CGFloat AA = 0;
        static int a = 1;
        [aPath addCurveToPoint:CGPointMake(230, 200) controlPoint1:CGPointMake(160, 200+AA) controlPoint2:CGPointMake(160, 200-AA)];
        [aPath stroke];
        AA+=.5*a;
        if (AA>=30 || AA<=0) {
            a *= -1;
        }
        
    }
}

- (void)Bbenline{
    
    if (_timer.isValid) {
        UIColor *color = [UIColor whiteColor];
        [color set]; //设置线条颜色
        
        UIBezierPath* aPath = [UIBezierPath bezierPath];
        
        aPath.lineWidth = .25;
        aPath.lineCapStyle = kCGLineCapRound; //线条拐角
        aPath.lineJoinStyle = kCGLineCapRound; //终点处理
        
        [aPath moveToPoint:CGPointMake(90, 200)];
        
        static CGFloat AA = 0;
        static int a = 1;
        [aPath addCurveToPoint:CGPointMake(230, 200) controlPoint1:CGPointMake(160, 200+AA) controlPoint2:CGPointMake(160, 200-AA)];
        [aPath stroke];
        AA+=.25*a;
        if (AA>=15 || AA<=0) {
            a *= -1;
        }
        
    }
}
@end
