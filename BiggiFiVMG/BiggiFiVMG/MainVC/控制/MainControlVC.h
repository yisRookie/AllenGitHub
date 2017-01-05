//
//  MainControlVC.h
//  BiggiFiVMG
//
//  Created by 峰 on 15/6/10.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import <UIKit/UIKit.h>

//操作模式
typedef enum {
    TOUCH_MODE = 0,         //触摸模式
    
    MOUSE_MODE = 1,         //鼠标模式
}OPERATE_MODE;

@interface MainControlVC : UIViewController{



}


@property (weak, nonatomic) IBOutlet UIImageView *backImageV;

@property (nonatomic, assign) OPERATE_MODE control_Mode;

@property (nonatomic, strong) NSString *ipAddress;

@property (nonatomic, assign) UInt16 port;
@end
