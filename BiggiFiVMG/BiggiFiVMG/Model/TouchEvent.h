//
//  TouchEvent.h
//  BiggiFiVMG
//
//  Created by 峰 on 15/6/18.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TouchEvent : NSObject{
    UITouch *touch;
    int     eventID;
}
@property(nonatomic, strong) UITouch *touch;
@property(nonatomic, assign) int     eventID;

@end
