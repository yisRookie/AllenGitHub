//
//  BiggiFiVmaStub.h
//  BiggiFiVMGPlus
//
//  Created by ying xiang on 13-2-8.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AsyncSocket.h"
#import "AsyncUdpSocket.h"

@interface BiggiFiVmaStub : NSObject{
    
    AsyncSocket             *mCmdSocket;        //tcp socket(用于开关闭重力感应、摇控器操作)
    
    AsyncUdpSocket          *mCtrlSocket;       //udp socket(用于触摸及鼠标操作)
    
    NSString                *mSVmaIP;
    
    AsyncSocket             *sscSocket;         //用于截屏的socket请求
    
}

-(void)sendBiggiFiVmaMobileKeyData:(int)key;

-(void)sendBiggiFiVmaMobileData:(int)key;

@end
