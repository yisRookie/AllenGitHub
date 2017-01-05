//
//  MiFMPointView.m
//  DrawTestDemo
//
//  Created by 峰 on 15/7/31.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import "MiFMPointView.h"

@interface MiFMPointView ()

@property (nonatomic, assign) BOOL beginAnmination;
@property (nonatomic) int circle;

@end

@implementation MiFMPointView
@synthesize beginAnmination;
@synthesize circle;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSTimer *_timer = [NSTimer scheduledTimerWithTimeInterval:1/40. target:self selector:@selector(setNeedsDisplay) userInfo:nil repeats:YES];;
        
        
        [_timer fire];
        beginAnmination = YES;
        circle = 0;
        
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    //===========================================================================================================
    //      画点
    CGContextRef context = UIGraphicsGetCurrentContext();
    [[UIColor grayColor] set];
    CGContextFillRect(context, rect);
    for (int i = 0; i<120; i++) {
        
//        if (i == 90) {
//            //中间一排小点
//            for (int b = 0; b<32; b++) {
//                CGContextAddEllipseInRect(context, [self caucle:i withOriginalPoint:self.center withSize:3 andRadio:(190-5*b)]);
//                [[UIColor colorWithRed:255. green:255. blue:255. alpha:.97 - .03*b]set];
//                CGContextFillPath(context);
//                
//            }
//            if(beginAnmination){
//                if (circle < 30){
//                    for (int c = 0; c<6; c++) {
//                        
//                        CGContextAddEllipseInRect(context, [self caucle:i withOriginalPoint:self.center withSize:3 andRadio:(190-5*circle-5*c)]);
//                        [[UIColor colorWithRed:255. green:255. blue:0 alpha:1]set];
//                        CGContextFillPath(context);
//                    }
//                }
//            }
//            
//        }else{
            //其他很多小点
            for (int a = 0; a <8; a++) {
                
                CGContextAddEllipseInRect(context, [self caucle:i withOriginalPoint:self.center withSize:3 andRadio:100-5*a]);
                [[UIColor colorWithRed:255. green:255. blue:255. alpha:1-0.1*a]set];
                CGContextFillPath(context);
                
            }
            
            if(beginAnmination){
                
                if (circle >30&&circle<39) {
                    //                    for (int c = 0; c<4; c++) {
                    
                    CGContextAddEllipseInRect(context, [self caucle:i withOriginalPoint:self.center withSize:3 andRadio:(60+5*(circle-30))]);
                    [[UIColor colorWithRed:255. green:255. blue:0 alpha:1]set];
                    CGContextFillPath(context);
                    
                    CGContextAddEllipseInRect(context, [self caucle:i withOriginalPoint:self.center withSize:3 andRadio:(60+5*(circle-31))]);
                    [[UIColor colorWithRed:255. green:255. blue:0 alpha:.9]set];
                    CGContextFillPath(context);
                    
                    CGContextAddEllipseInRect(context, [self caucle:i withOriginalPoint:self.center withSize:3 andRadio:(60+5*(circle-32))]);
                    [[UIColor colorWithRed:255. green:255. blue:0 alpha:.8]set];
                    CGContextFillPath(context);
                    //                    }
                }
                
            }
            
            
            
//        }
    }
    //     画 4个 圆圈
    //void CGContextAddArc(CGContextRef c,CGFloat x, CGFloat y,CGFloat radius,CGFloat startAngle,CGFloat endAngle, int clockwise)1弧度＝180°/π （≈57.3°） 度＝弧度×180°/π 360°＝360×π/180 ＝2π 弧度
    // x,y为圆点坐标，radius半径，startAngle为开始的弧度，endAngle为 结束的弧度，clockwise 0为顺时针，1为逆时针。
    for (int b = 0; b<4; b++) {
        CGContextSetRGBStrokeColor(context,255,255,255,.85-.2*b);//画笔线的颜色
        CGContextSetLineWidth(context, 1.0);//线的宽度
        CGContextAddArc(context,self.center.x,self.center.y, 110+10*b, 0.255*2*M_PI, (1.24)*2*M_PI, 0); //添加一个圆
        CGContextDrawPath(context, kCGPathStroke); //绘制路径
    }
    if(beginAnmination){
        if (circle>39&&circle<42) {
            CGContextSetRGBStrokeColor(context,255,255,255,1);//画笔线的颜色
            CGContextSetLineWidth(context, 1.0);//线的宽度
            CGContextAddArc(context,self.center.x,self.center.y, 110+10*(circle-39), 0.255*2*M_PI, (1.24)*2*M_PI, 0); //添加一个圆
            CGContextDrawPath(context, kCGPathStroke); //绘制路径
        }
        
    }
    
    self.layer.shouldRasterize=YES;
    

    
    circle++;
    if (circle == 60) {
        circle = 0;
    }
    
}
/**
 *  120 个点组成一个圆,每3度 一个点
 *
 *  @param number 点的位置数（第number个）
 *  @param point  圆心坐标
 *  @param weight 点的直径
 *  @param R      点所在圆的半径
 *
 *  @return 每个小点的rect
 */
- (CGRect)caucle:(int)number withOriginalPoint:(CGPoint)point withSize:(float)size andRadio:(float)R{
    //第一个点默认是 9点钟位置
    float xA = (point.x-R)+R*(1-cosf(number*3*M_PI/180));
    float yA = point.y-R*sinf(number*3*M_PI/180);
    CGRect circ=CGRectMake(xA, yA, size,size);
    return circ;
}

@end
