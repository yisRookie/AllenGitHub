//
//  ToolView.h
//  BiggiFiVMG
//
//  Created by 峰 on 15/6/16.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ButtonActionBlock)(id object);

@interface ToolView : UIView
@property (nonatomic ,strong) ButtonActionBlock toolViewButtonBlock;
@end
