//
//  BiggiFiSocket.h
//  BiggiFiVMG
//
//  Created by 峰 on 15/6/11.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AsyncSocket.h"
#import "AsyncUdpSocket.h"
#import "DeviceModel.h"
#import <UIKit/UIKit.h>
#import "TouchEvent.h"
#import "MainModel.h"

typedef void (^loginSuccessBlock)(BOOL success);

@interface BiggiFiSocket : NSObject<AsyncSocketDelegate>{
    
    //连接客户端
    AsyncSocket    *connect_Socket;
    //配置wifi成功后，给launcher一个确认，进入主菜单 （1.0版本暂时没用）
    AsyncSocket    *wifiConfigOkSocket;
    //检测
    AsyncUdpSocket *vma_CheckSocket;
    //搜索
    AsyncUdpSocket *search_Socket;
    //控制socket
    AsyncUdpSocket *control_Socket;
    //截屏
    AsyncSocket    *screenShot_Socket;
    int  jpgret;
    NSMutableData  *jpgData;

}

@property (nonatomic, strong) NSMutableArray *modelArray;

@property (nonatomic, assign) NSInteger searchTimes;

@property (nonatomic, strong) NSString *hostIPAddress;

@property (nonatomic) BOOL loginSuccess;

@property (nonatomic, strong) loginSuccessBlock loginSuccessBlock;

@property (nonatomic, strong) MainModel *mainModel;
//FIXME: 老版本截屏部分
@property (nonatomic, strong) UIImage *screenImage;

+ (instancetype)sharedInstance;


/**
 *  搜索棒子
 */
- (void)searchDevice;
/**
 *   开启tcp socket(开始登陆) 发送OK信息，告诉launcher wifi配置成功了
 */
- (void)tellLauncherWiFiSettingSuccess:(NSString *)ipAddress onPort:(UInt16)port;

/**
 *  连接棒子
 */
- (void)connectionDeviceBySocket:(NSString *)ipAddress onPort:(UInt16)port;
/**
 *  检测设备活跃
 */
- (void)checkVMAalive;


/**
 *  请求服务端操作模式
 */
- (void)requestVMGControlMode;
/**
 * 底部指令发送
 *
 *  @param key 指令
 */
-(void)sendBiggiFiVmaMobileKeyData:(int)key;

/**
 *  鼠标模式 指令发送
 */
-(void)sendBiggiFiVmaMouseData:(int)actionType withX:(int)xOffset withY:(int)yOffset toHost:(NSString*)VmaIP withport:(UInt16)port;
/**
 *  @brief  截屏事件
 */

-(void)sendScreenShotCMDWithHost:(NSString *)mSVmaIP;

@end
