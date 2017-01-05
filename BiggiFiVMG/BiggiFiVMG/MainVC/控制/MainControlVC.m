//
//  MainControlVC.m
//  BiggiFiVMG
//
//  Created by 峰 on 15/6/10.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import "MainControlVC.h"
#import "SettingsVC.h"
#import "ToolView.h"
#import "MoreView.h"
#import "BiggiFiUtil.h"
#import "BiggiFiSocket.h"
#import "SettingManagement.h"
#import <CoreMotion/CoreMotion.h>

@interface MainControlVC (){
    
    int mStartx,mStarty,mLastx,mLasty,mLastx2,mLasty2;
    int mXoffset, mYoffset,XXX,YYY;
    int mLastAction;
}

@property (nonatomic, strong) MoreView *moreV;
@end


@implementation MainControlVC

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self AddToolView];
    
    [self AddMoreView];
    //默认是鼠标模式
    self.control_Mode = MOUSE_MODE;
    
    
//  CMMotionManager *motionManager = [[CMMotionManager alloc] init];
    
//    UIAccelerometer *accelerpmeter = [UIAccelerometer sharedAccelerometer];
//    accelerpmeter.delegate = self;
//    accelerpmeter.updateInterval = 1.0/60.0;
    
    
    DDLog(@"---------%d",[[[SettingManagement instance].setDic objectForKey:@"TouchRate"] intValue]);
    
}




- (void)viewWillAppear:(BOOL)animated{
    
    self.navigationController.navigationBarHidden = YES;
    [BiggiFICategory setDeviceLanLandscape];

}

- (void)AddToolView{
    ToolView *toolView = [[ToolView alloc]init];
    [toolView setFrame:CGRectMake(170, 10, 260, 40)];
    toolView.hidden = NO;
    [self.view addSubview:toolView];
    
    WEAKSELF
    toolView.toolViewButtonBlock = ^(id object){
        UIButton *button = (UIButton *)object;
        switch (button.tag) {
            case 0:
//                [[BiggiFiSocket sharedInstance] sendScreenShotCMDWithHost:_ipAddress];
//                self.view.backgroundColor = [UIColor colorWithPatternImage:[BiggiFiSocket sharedInstance].mainModel.screenImage];
//                weakSelf.backImageV.image = [BiggiFiSocket sharedInstance].screenImage;
                break;
            case 1:
                weakSelf.moreV.hidden = NO;
                break;
            case 2:
                
                break;
            default:
                break;
        }
    
    };
}

- (void)AddMoreView{
    
    self.moreV = [[MoreView alloc]initWithFrame:CGRectMake(0, DEVICWIDTH-100, DEVICEHEIGH, 100)];
    WEAKSELF
    self.moreV.buttonClickBlock = ^(){
        SettingsVC *setVC=[[SettingsVC alloc]init];
        [weakSelf.navigationController pushViewController:setVC animated:YES];
    };
    self.moreV.hidden = YES;
    [self.view addSubview:self.moreV];
    
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}


//0 为触摸模式  1 为鼠标模式
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    if (self.moreV.hidden==NO) {
        self.moreV.hidden=YES;
    }
    switch (self.control_Mode) {
        case 0:
            
            break;
        case 1:
            
            [self mouse:touches action:MOUSE_ACTION_DOW];
            
            break;
        default:
            
            break;
    }
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
    switch (self.control_Mode) {
        case 0:
            
            break;
        case 1:
            
            [self mouse:touches action:MOUSE_ACTION_MOV];
            
            break;
        default:
            
            break;
    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
    switch (self.control_Mode) {
        case 0:
            
            break;
        case 1:
            
            [self mouse:touches action:MOUSE_ACTION_UPX];
            
            break;
        default:
            
            break;
    }
    
    
}

//mouse mode
-(void)mouse:(NSSet*)touches action:(int)type{
    if (touches.count == 1) {
        UITouch *touch = [touches anyObject];
        CGPoint point = [touch locationInView:self.view];
        int x = (int) point.x;
        int y = (int) point.y;
        if (mLastx == -1) {
            mXoffset = mYoffset = 0;
        } else {
//            int mMouseOffsetRatio = [[[SettingManagement instance].setDic objectForKey:@"TouchRate"] intValue];
          int  mMouseOffsetRatio = 3;
            mXoffset = [BiggiFiUtil multiply:(x - mLastx) ratio:mMouseOffsetRatio];
            mXoffset = [BiggiFiUtil multiply:(y - mLasty) ratio:mMouseOffsetRatio];
        }
        mLastx = x;
        mLasty = y;
        
        if (type == MOUSE_ACTION_UPX) {
            mLastx = mLasty = -1;
            if (abs(mLastx-mStartx)<6&&abs(mLasty-mStarty)<6) {
                
                [[BiggiFiSocket sharedInstance]sendBiggiFiVmaMouseData:type withX:mXoffset withY:mXoffset toHost:self.ipAddress withport:self.port];
                return;
            }
            mLastx = mLasty = -1;
            mLastx2 = mLasty2 = -1;
        }
        [[BiggiFiSocket sharedInstance]sendBiggiFiVmaMouseData:type withX:mXoffset withY:mXoffset toHost:self.ipAddress withport:self.port];
    }else{
        UITouch *touch = [[touches allObjects] lastObject];
        CGPoint point = [touch locationInView:self.view];
        int x1 = (int) point.x;
        int y1= (int) point.y;
        if (mLastx2 == -1) {
            mXoffset = mYoffset = 0;
        } else {
//            int mMouseOffsetRatio = [[[SettingManagement instance].setDic objectForKey:@"TouchRate"] intValue];
            mXoffset = [BiggiFiUtil multiply:(x1 - mLastx) ratio:3];
            mYoffset = [BiggiFiUtil multiply:(y1 - mLasty) ratio:3];
            mYoffset = mYoffset >> 1; 	//equals 'mYoffset / 2'
        }
        mLastx2 = x1;
        mLasty2 = y1;
        [[BiggiFiSocket sharedInstance]sendBiggiFiVmaMouseData:type withX:mXoffset withY:mXoffset toHost:self.ipAddress withport:self.port];
        
        
    }
}

@end
