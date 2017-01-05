//
//  BiggiFiVmaStub.m
//  BiggiFiVMGPlus
//
//  Created by ying xiang on 13-2-8.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

//操作消息发送单例
#import "BiggiFiVmaStub.h"
#import "KeyCode.h"

static BiggiFiVmaStub *singleStub = nil;

@implementation BiggiFiVmaStub

+(BiggiFiVmaStub*)instance{
    if (singleStub == nil) {
        singleStub = [[self alloc] init];
    }
    return singleStub;
}

//遥控器发送数据
-(void)sendBiggiFiVmaMobileKeyData:(int)key{
    
    Byte byte[] = {CMD_MOBILE_KEY,key};
    NSData *data = [NSData dataWithBytes:byte length:2];
    
    //tcpp发送data
    [mCmdSocket readDataWithTimeout:-1 tag:1];
    [mCmdSocket writeData:data withTimeout:-1 tag:1];
}

//手柄发送数据
-(void)sendBiggiFiVmaMobileData:(int)key
{
    Byte byte[] = {CMD_JOYPAD_BUTTON,key};
    NSData *data = [NSData dataWithBytes:byte length:2];
    
    //tcpp发送data
    [mCmdSocket readDataWithTimeout:-1 tag:1];
    [mCmdSocket writeData:data withTimeout:-1 tag:1];
  
}

@end
