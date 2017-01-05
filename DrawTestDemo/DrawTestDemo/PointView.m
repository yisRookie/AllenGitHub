//
//  PointView.m
//  DrawTestDemo
//
//  Created by 峰 on 15/7/31.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import "PointView.h"
#import "MiFMPointView.h"

@interface subPointV : UIView

@property (nonatomic, assign) float Radio;
@property (nonatomic, assign) float angel;
@property (nonatomic, assign) BOOL STOP;
@property (nonatomic, assign) float AAA;

@end
@implementation subPointV
@synthesize AAA;


- (id)init
 {
     if (self=[super init]){
         NSLog(@"nininini");
     }
     return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        self.STOP = NO;
        AAA = 9;
    }
    return self;
}

- (void)start{
    NSTimer *_timer = [NSTimer scheduledTimerWithTimeInterval:1.0/3 target:self selector:@selector(setNeedsDisplay) userInfo:nil repeats:YES];;
    
    [_timer fire];

}

- (void)drwaPointView:(CGRect)rect{
    self.Radio = 2;
    //设置画板
    CGContextRef context = UIGraphicsGetCurrentContext();
    [[UIColor grayColor] set];
    CGContextFillRect(context, rect);
    //画圆点
    for (int i = 0; i<10; i++) {
        CGRect frame = CGRectMake(0, 0+5*i, _Radio, _Radio);
        CGContextAddEllipseInRect(context, frame);
        [[UIColor colorWithRed:255. green:255. blue:255. alpha:.9-0.09*i] set];
        CGContextFillPath(context);
    }
    
    self.layer.shouldRasterize=YES;
    self.STOP = YES;
}

- (void)drawRect:(CGRect)rect{

    [super drawRect:rect];
    
    if (self.STOP==NO) {
             self.STOP = YES;
    }else{

        //设置画板
        CGContextRef context = UIGraphicsGetCurrentContext();
        [[UIColor grayColor] set];
        CGContextFillRect(context, rect);
        
        
        for (int i = 0; i<9; i++) {
            CGRect frame = CGRectMake(0,10*i, 2, 2);
            CGContextAddEllipseInRect(context, frame);
            [[UIColor colorWithRed:255. green:255. blue:255. alpha:.8-0.08*i] set];
            CGContextFillPath(context);
        }
        
        for (int a =0; a<3; a++) {
            CGRect frame = CGRectMake(0, 10*AAA-a*10, 2, 2);
            CGContextAddEllipseInRect(context, frame);
            [[UIColor colorWithRed:255. green:255. blue:255. alpha:1.] set];
            CGContextFillPath(context);
        }
        
        
        //画圆点
        
        AAA--;
        
        if (AAA==0) {
            AAA = 9;
        }


    self.layer.shouldRasterize=YES;
    }
    
}
- (void)setAngel:(float)angel{
    _angel = angel;
    self.transform = CGAffineTransformMakeRotation(angel);
}

@end
//32个点的View
@interface LineView : UIView
@property (nonatomic, assign) float angel;

@end
@implementation LineView
- (void)drawRect:(CGRect)rect{
    
    [super drawRect:rect];
   
    //设置画板
    CGContextRef context = UIGraphicsGetCurrentContext();
    [[UIColor grayColor] set];
    CGContextFillRect(context, rect);
    //画8个圆点
    for (int i = 0; i<30; i++) {
        CGRect frame = CGRectMake(0, 0+5*i, 3, 3);
        CGContextAddEllipseInRect(context, frame);
        [[UIColor colorWithRed:255. green:255. blue:255. alpha:.9-0.03*i] set];
        CGContextFillPath(context);
    }
    
    self.layer.shouldRasterize=YES;
}
- (void)setAngel:(float)angel{
    _angel = angel;
    self.transform = CGAffineTransformMakeRotation(angel);
}

@end
//4个圆圈
@interface circleView : UIView

@end

@implementation circleView
- (void)drawRect:(CGRect)rect{

    //--1--画圆 半径 110
    [super drawRect:rect];
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetRGBStrokeColor(context,1,1,1,1.0);
    CGContextSetLineWidth(context, 1.0);
    CGContextAddArc(context,50, 50, 40, 0, 2*M_PI, 0);
    CGContextDrawPath(context, kCGPathStroke);
    self.layer.shouldRasterize=YES;
}

@end

@interface PointView ()

@property ( nonatomic, strong) subPointV *subV ;

@end
@implementation PointView
@synthesize subV;

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor grayColor];
        [self addPointViews];
    }

    return self;
}
//dispatch_apply(5, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(size_t index) {
//    NSLog(@"反复执行 %ld, 当前线程%@", index, [NSThread currentThread]);
//});

- (void)addPointViews{
    //加载view
    
    CGRect aaa = CGRectMake(0, 0, 100, 100);
    circleView *circle = [[circleView alloc]initWithFrame:aaa];
    [self addSubview:circle];
    
    for (int i = 0; i <121; i++) {
        
        if (i!=60) {
            CGRect aaa= CGRectMake(self.center.x, self.center.y, 3, 130);
            subV = [[subPointV alloc]initWithFrame:aaa];
            subV.layer.anchorPoint = CGPointMake(1., 1.);
            subV.angel = i*3*M_PI/180;
            subV.STOP = YES;
//            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                //            });
            
            [self addSubview:subV];
            [subV start];

            
        }else{
            CGRect bbb = CGRectMake(self.center.x, self.center.y, 3, 150);
            LineView *lineV = [[LineView alloc]initWithFrame:bbb];
            lineV.layer.anchorPoint = CGPointMake(1, 1.2);
            lineV.angel =i*3*M_PI/180;
            [self addSubview:lineV];
            
        }

        
    }
    

    
    
}
@end
