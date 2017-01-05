//
//  MoreView.m
//  BiggiFiVMG
//
//  Created by 峰 on 15/6/16.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import "MoreView.h"
#import "BiggiFiSocket.h"

@implementation MoreView
//3 个 button 位置  -60-button-button-button-60-
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        backBtn.frame = CGRectMake(40,0,100,100);
        backBtn.tag = 0;
        [backBtn setImage:[UIImage imageNamed:@"backimage.png"] forState:UIControlStateNormal];
        backBtn.imageEdgeInsets = UIEdgeInsetsMake(5,13,21,backBtn.titleLabel.bounds.size.width);//设置image在button上的位置（上top，左left，下bottom，右right）这里可以写负值，对上写－5，那么image就象上移动5个像素
        [backBtn addTarget:self action:@selector(moreButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [backBtn setTitle:@"返回" forState:UIControlStateNormal];//设置button的title
        backBtn.titleLabel.font = [UIFont systemFontOfSize:16];//title字体大小
        backBtn.titleLabel.textAlignment = NSTextAlignmentCenter;//设置title的字体居中
        [backBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];//设置title在一般情况下为白色字体
        backBtn.titleEdgeInsets = UIEdgeInsetsMake(71, -backBtn.titleLabel.bounds.size.width-62, 0, 0);
        [self addSubview:backBtn];
        
        UIButton *setBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        setBtn.frame = CGRectMake(self.center.x-50,0,100,100);
        setBtn.tag = 1;
        [setBtn setImage:[UIImage imageNamed:@"settingimage"] forState:UIControlStateNormal];
        setBtn.imageEdgeInsets = UIEdgeInsetsMake(5,13,21,setBtn.titleLabel.bounds.size.width);
        [setBtn addTarget:self action:@selector(moreButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [setBtn setTitle:@"设置" forState:UIControlStateNormal];
        setBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        setBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [setBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        setBtn.titleEdgeInsets = UIEdgeInsetsMake(71, -setBtn.titleLabel.bounds.size.width-60, 0, 0);
        [self addSubview:setBtn];
        
        UIButton *exitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        exitBtn.frame = CGRectMake(self.frame.size.width-140,0,100,100);
        exitBtn.tag = 2;
        [exitBtn setImage:[UIImage imageNamed:@"exit"] forState:UIControlStateNormal];
        exitBtn.imageEdgeInsets = UIEdgeInsetsMake(5,13,21,exitBtn.titleLabel.bounds.size.width);
        [exitBtn addTarget:self action:@selector(moreButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [exitBtn setTitle:@"退出" forState:UIControlStateNormal];
        exitBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        exitBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [exitBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        exitBtn.titleEdgeInsets = UIEdgeInsetsMake(71, -exitBtn.titleLabel.bounds.size.width-63, 0, 0);
        [self addSubview:exitBtn];
        [exitBtn addActionHandler:^(NSInteger tag) {
            
        }];
//
    
    }
    
    return self;
}

- (void)moreButtonClick:(id)sender {
    UIButton *button = (UIButton *)sender;
    switch (button.tag) {
        case 0:{
            [[BiggiFiSocket sharedInstance] sendBiggiFiVmaMobileKeyData:BACK];
        }
            break;
        case 1:{
            if (_buttonClickBlock) {
                self.buttonClickBlock();
            }
        
        }
            break;
         case 2:
            exit(0);
            break;
        default:
            break;
    }
    
    
    
}


@end
