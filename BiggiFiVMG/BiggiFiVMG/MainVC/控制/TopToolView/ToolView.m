//
//  ToolView.m
//  BiggiFiVMG
//
//  Created by 峰 on 15/6/16.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import "ToolView.h"

@implementation ToolView


- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
        UIButton *modeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        modeBtn.frame = CGRectMake(30, 0, 40, 40);
        [modeBtn setBackgroundImage:[UIImage imageNamed:@"mouse_mode"] forState:UIControlStateNormal];
        [modeBtn setBackgroundImage:[UIImage imageNamed:@"touch_mode"] forState:UIControlStateSelected];
        modeBtn.tag = 0;
        [modeBtn addTarget:self action:@selector(ToolButtonAction:)forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:modeBtn];
        
        
        UIButton *moreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        moreBtn.frame = CGRectMake(110, 0, 40, 40);
        [moreBtn setBackgroundImage:[UIImage imageNamed:@"more"] forState:UIControlStateNormal];
        moreBtn.tag = 1;
        [moreBtn addTarget:self action:@selector(ToolButtonAction:)forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:moreBtn];
        
        
        UIButton *helpBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [helpBtn setBackgroundImage:[UIImage imageNamed:@"help"] forState:UIControlStateNormal];
        helpBtn.frame = CGRectMake(190, 0, 40, 40);
        helpBtn.tag = 2;
        [helpBtn addTarget:self action:@selector(ToolButtonAction:)forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:helpBtn];
        
    }
    
    return self;
}
- (void)ToolButtonAction:(id)sender {
    UIButton *button = (UIButton *)sender;
    switch (button.tag) {

        case 0:
            button.selected = !button.selected;
            break;
        default:
            break;
    }

    if (_toolViewButtonBlock) {
        _toolViewButtonBlock(button);
    }
    
    
}

@end
