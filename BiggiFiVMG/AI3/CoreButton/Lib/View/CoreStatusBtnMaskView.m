//
//  CoreStatusBtnMaskView.m
//  CoreBtn
//
//  Created by 沐汐 on 15-3-2.
//  Copyright (c) 2015年 沐汐. All rights reserved.
//

#import "CoreStatusBtnMaskView.h"
#import "MaskViewAnimView.h"
#import "UIView+CoreBtnExtend.h"

@interface CoreStatusBtnMaskView ()

@property (weak, nonatomic) IBOutlet UILabel *msgLabel;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *iv;


/** 动画view */
@property (nonatomic,strong) MaskViewAnimView *animView;

@end


@implementation CoreStatusBtnMaskView


/**
 *  maskView
 */
+(instancetype)maskView{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] firstObject];
}

-(void)awakeFromNib{
    
    [super awakeFromNib];
    self.status=CoreStatusBtnStatusNormal;
}



-(void)didMoveToSuperview{
    
    [super didMoveToSuperview];
    
    [self constraintAdd];
}





/**
 *  状态改变
 */
-(void)setStatus:(CoreStatusBtnStatus)status{
    
    _status=status;
    
    [self actionWithStatus:status];
}

-(void)actionWithStatus:(CoreStatusBtnStatus)status{
    
    //性能优化
    if(CoreStatusBtnStatusProgress==status){
        [self.iv startAnimating];
    }else{
        [self.iv stopAnimating];
    }
    
    switch (status) {
        case CoreStatusBtnStatusNormal://正常
            [self statusNormal];
            break;
            
        case CoreStatusBtnStatusProgress://进度
            [self statusProgress];
            break;
            
        case CoreStatusBtnStatusSuccess://成功
            [self statusSuccess];
            break;
            
        case CoreStatusBtnStatusFalse://失败
            [self statusFalse];
            break;
            
        default:
            break;
    }
}

/**
 *  正常
 */
-(void)statusNormal{
    
    //看不到自己
    self.alpha=.0f;
}

/**
 *  进度
 */
-(void)statusProgress{
    
    self.alpha=1.0f;
    
    if(self.shutOffZoomAnim) return;
    
    //显示
    [self.animView show:self];
}

/**
 *  成功
 */
-(void)statusSuccess{
    [UIView animateWithDuration:0.5f animations:^{
        self.alpha=.0f;
    }];
}

/**
 *  失败
 */
-(void)statusFalse{
    [UIView animateWithDuration:0.5f animations:^{
        self.alpha=.0f;
    }];
}


-(void)setMsg:(NSString *)msg{
    
    _msg=msg;
    
    _msgLabel.text=msg;
}

-(void)setStatusBtn:(CoreStatusBtn *)statusBtn{
    
    _statusBtn=statusBtn;
    
    self.backgroundColor=statusBtn.backgroundColorForNormal;
    
    self.msgLabel.font=statusBtn.titleLabel.font;
    
    UIColor *color=[statusBtn titleColorForState:UIControlStateNormal];
    self.msgLabel.textColor=color;
    self.iv.color=color;
}



-(MaskViewAnimView *)animView{
    
    if(_animView == nil){
        
        _animView = [[MaskViewAnimView alloc] init];

        _animView.frame = self.bounds;
        
        _animView.backgroundColor=self.backgroundColor;
    }
    
    return _animView;
}


@end
