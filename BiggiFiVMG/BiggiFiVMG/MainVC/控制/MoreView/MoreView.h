//
//  MoreView.h
//  BiggiFiVMG
//
//  Created by 峰 on 15/6/16.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^setButtonClickBlock)();

@interface MoreView : UIView


@property (nonatomic, strong) setButtonClickBlock buttonClickBlock;
@end
