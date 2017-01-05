//
//  BiggiFiSocket.m
//  BiggiFiVMG
//
//  Created by 峰 on 15/6/11.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import "BiggiFiSocket.h"
#import "DeviceModel.h"
#import "BiggiFiUtil.h"
#import "MainModel.h"

@implementation BiggiFiSocket

+ (instancetype)sharedInstance
{
    static dispatch_once_t once;
    static id sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

-(instancetype)init{
    
    self=[super init];
    
    if (self) {
        control_Socket = [[AsyncUdpSocket alloc]initWithDelegate:self];
        
    }
    return  self;
}

#pragma mark 搜索biggifi 服务
-(void)searchDevice{
    
    if (search_Socket == nil) {
        search_Socket=[[AsyncUdpSocket alloc]initWithDelegate:self];
        self.searchTimes = 0;
    }
    NSError *error =[[NSError alloc] init];
    
    if (!self.modelArray) {
        self.modelArray = [NSMutableArray array];
    }
    
    [search_Socket enableBroadcast:YES error:&error];
    
    NSData *data = [CMD_SEARCH dataUsingEncoding:NSUTF8StringEncoding];
    
    [search_Socket sendData:data toHost:BoardCastIP port:VMA_ALIVE_PORT withTimeout:3.0 tag:0];
    
    
}

#pragma mark 老版本 告诉launch 端 wifi 配置完成
- (void)tellLauncherWiFiSettingSuccess:(NSString *)ipAddress onPort:(UInt16)port{
    
    NSError *errorWifi = nil;
    if (wifiConfigOkSocket == nil) {
        wifiConfigOkSocket = [[AsyncSocket alloc] initWithDelegate:self];
    }
    [wifiConfigOkSocket connectToHost:ipAddress onPort:port withTimeout:3.0 error:&errorWifi];
}

#pragma mark 连接biggifi 服务
-(void)connectionDeviceBySocket:(NSString *)ipAddress onPort:(UInt16)port{
    
    NSError *error = nil;
    if (connect_Socket == nil) {
        connect_Socket = [[AsyncSocket alloc] initWithDelegate:self];
    }else{
        [connect_Socket setDelegate:nil];
        [connect_Socket disconnect];
        connect_Socket=nil;
    }
    [connect_Socket connectToHost:ipAddress onPort:port withTimeout:4.0 error:&error];
    
}

#pragma mark 检查 服务心跳
-(void)checkVMAalive{
    if (vma_CheckSocket == nil) {
        vma_CheckSocket = [[AsyncUdpSocket alloc] initWithDelegate:self];
        //        failCount = 0;
    }
    
    NSData * data = [@"SCN_RANDOM" dataUsingEncoding:NSUTF8StringEncoding];
    //广播（255.255.255.255）都是可以的
    [vma_CheckSocket sendData:data toHost:BoardCastIP port:VMA_ALIVE_PORT withTimeout:3 tag:0];
    
    [vma_CheckSocket receiveWithTimeout:3 tag:0];
}


#pragma mark VMG的控制方式（鼠标还是触摸）
- (void)requestVMGControlMode{

    
}
/**
 *  @brief  截屏操作
 */
-(void)sendScreenShotCMDWithHost:(NSString *)mSVmaIP{

    jpgret = 0;
    screenShot_Socket = [[AsyncSocket alloc] initWithDelegate:self];
    NSError *error = [[NSError alloc] init];
    [screenShot_Socket connectToHost:mSVmaIP onPort:VMA_SCRSHOTSC_PORT withTimeout:-1 error:&error];
    
}
#pragma mark 底部工具栏 指令的发送
-(void)sendBiggiFiVmaMobileKeyData:(int)key{
    
    NSMutableData *data = [NSMutableData data];
    NSData *cmd = [BiggiFiUtil shortToData:CMD_MOBILE_KEY];
    NSData *keyByte = [BiggiFiUtil intToData:key];
    [data appendData:cmd];
    [data appendData:keyByte];
    //tcp发送data
    [connect_Socket writeData:data withTimeout:-1 tag:1];
}

#pragma mark 鼠标指令的发送
-(void)sendBiggiFiVmaMouseData:(int)actionType withX:(int)xOffset withY:(int)yOffset toHost:(NSString*)VmaIP withport:(UInt16)port{
    
    NSMutableData *data = [NSMutableData data];
    
    switch (actionType) {
        case MOUSE_ACTION_DOW:{
          
            NSData *cmd = [BiggiFiUtil shortToData:CMD_MOUSE_DOW];
            NSData *xByte = [BiggiFiUtil intToData:xOffset];
            NSData *yByte = [BiggiFiUtil intToData:yOffset];
            [data appendData:cmd];
            [data appendData:xByte];
            [data appendData:yByte];

            break;
        }
        case MOUSE_ACTION_MOV:{
            
            NSData *cmd = [BiggiFiUtil shortToData:CMD_MOUSE_MOV];
            NSData *xByte = [BiggiFiUtil intToData:xOffset];
            NSData *yByte = [BiggiFiUtil intToData:yOffset];
            [data appendData:cmd];
            [data appendData:xByte];
            [data appendData:yByte];
        
            break;
        }
        case MOUSE_ACTION_UPX:{
            
            NSData *cmd = [BiggiFiUtil shortToData:CMD_MOUSE_UPX];
            NSData *xByte = [BiggiFiUtil intToData:xOffset];
            NSData *yByte = [BiggiFiUtil intToData:yOffset];
            [data appendData:cmd];
            [data appendData:xByte];
            [data appendData:yByte];

            break;
        }
        default:
            break;
    }
    if (data!=nil) {
        [control_Socket sendData:data toHost:VmaIP port:port withTimeout:-1 tag:0];
    }
    
}

////触摸
//
//-(void)sendBiggiFiVmaMultiTouchDataWithactionType:(int)actionType withEvent:(TouchEvent *)touchEvent
//{
//    NSMutableData *data = [NSMutableData data];
//    
//    NSLog(@"目前的=======触摸手指数量=%d",touchArray.count);
//    
//    switch (actionType) {
//        case CMD_MULTI_TOUCH_DOW:{
//            //1表示有一个点 0表示点的序列（第一个点）
//            int ID = touchEvent.eventID;
//            CGPoint point = [touchEvent.touch locationInView:self.view];
//            mPointStatus |=  (1 << (ID));
//            //mPointStatus &= (~(1 << (ID)));
//            NSData *cmd = [BiggiFiUtil shortToData:CMD_MULTI_TOUCH_DATA];
//            NSData *sByte = [BiggiFiUtil intToData:mPointStatus];
//            NSData *points = [BiggiFiUtil intToData:1];
//            NSData *current = [BiggiFiUtil intToData:ID];
//            NSData *action = [BiggiFiUtil intToData:CMD_MULTI_TOUCH_DOW];
//            NSData *xByte = [BiggiFiUtil intToData:point.x];
//            NSData *yByte = [BiggiFiUtil intToData:point.y];
//            //         NSLog(@"   add address:0x%.8x*****down status is %d,ID is %d******array count is %d", touchEvent.touch,mPointStatus,ID,[touchArray count]);
//            
//            [data appendData:cmd];
//            [data appendData:sByte];
//            [data appendData:points];
//            [data appendData:current];
//            [data appendData:action];
//            [data appendData:xByte];
//            [data appendData:yByte];
//            NSLog(@"======触摸按下去状态====");
//            break;
//        }
//        case CMD_MULTI_TOUCH_UPX:{
//            
//            int ID = touchEvent.eventID;
//            CGPoint point = [touchEvent.touch locationInView:self.view];
//            mPointStatus &= (~(1 << (ID)));
//            // mPointStatus |= (1 << (ID));
//            NSData *cmd = [BiggiFiUtil shortToData:CMD_MULTI_TOUCH_DATA];
//            NSData *sByte = [BiggiFiUtil intToData:mPointStatus];
//            NSData *points = [BiggiFiUtil intToData:1];
//            NSData *current = [BiggiFiUtil intToData:ID];
//            NSData *action = [BiggiFiUtil intToData:CMD_MULTI_TOUCH_UPX];
//            NSData *xByte = [BiggiFiUtil intToData:point.x];
//            NSData *yByte = [BiggiFiUtil intToData:point.y];
//            //            NSLog(@"remove address:0x%.8x*****  up status is %d,ID is %d******array count is %d", touchEvent.touch,mPointStatus,ID,[touchArray count]);
//            
//            [data appendData:cmd];
//            [data appendData:sByte];
//            [data appendData:points];
//            [data appendData:current];
//            [data appendData:action];
//            [data appendData:xByte];
//            [data appendData:yByte];
//            NSLog(@"======触摸松手离开状态====");
//            break;
//        }
//            
//        case CMD_MULTI_TOUCH_MOV:{
//            
//            //10 30
//            //int ID = touchEvent.eventID;
//            // mPointStatus |= (1 << (ID));
//            
//            NSData *cmd = [BiggiFiUtil shortToData:CMD_MULTI_TOUCH_DATA];
//            NSData *sByte = [BiggiFiUtil intToData:mPointStatus];
//            NSData *point = [BiggiFiUtil intToData:touchArray.count];
//            [data appendData:cmd];
//            [data appendData:sByte];
//            [data appendData:point];
//            
//            for (int i = 0; i<touchArray.count; i++) {
//                TouchEvent *touchEvent = [touchArray objectAtIndex:i];
//                CGPoint point = [touchEvent.touch locationInView:self.view];
//                
//                NSData *current = [BiggiFiUtil intToData:touchEvent.eventID];
//                NSData *action = [BiggiFiUtil intToData:CMD_MULTI_TOUCH_MOV];
//                NSData *xByte = [BiggiFiUtil intToData:point.x];
//                NSData *yByte = [BiggiFiUtil intToData:point.y];
//                //                NSLog(@"move address:0x%.8x*****  move status is %d,ID is %d******array count is %d", touchEvent.touch,mPointStatus,touchEvent.eventID,[touchArray count]);
//                
//                [data appendData:current];
//                [data appendData:action];
//                [data appendData:xByte];
//                [data appendData:yByte];
//                NSLog(@"======触摸拖动状态====");
//                
//            }
//            break;
//        }
//        default:
//            break;
//    }
//    
//    if (data != nil) {
//        //        NSLog(@"==========目前数量=%d",touchArray.count);
//        //        NSLog(@"===================datalength=%i",data.length);
//        if ( touchArray.count>4 && data.length< 74)
//        {
//            
//            [self removeTouchEvent:touchEvent];
//            
//        }else{
//            
//            [mCtrlSocket sendData:data toHost:mSVmaIP port:VMA_CMD_PORT withTimeout:0 tag:0];
//        }
//    }
//    
//}



#pragma mark TCP

- (BOOL)onSocketWillConnect:(AsyncSocket *)sock{
    
    if (sock == connect_Socket) {
    
        return YES;
    }
    if (sock == screenShot_Socket) {
        return YES;
    }
    return NO;
}
//是否连接上服务器（连接服务器）
- (void)onSocket:(AsyncSocket *)sock didConnectToHost:(NSString *)host port:(UInt16)port{
    
    if (sock == connect_Socket)
    {
        //给BiggiFi服务发送登录指令
        //self.loginSuccess = NO;
        if(self.loginSuccess==NO){
        NSMutableData *data = [NSMutableData data];
        short t = (short)CMD_LOGIN;
        NSData *byte = [BiggiFiUtil shortToData:t];
        [data appendData:byte];
        
        Byte loginName[16] = {'B','i','g','g','i','F','i'};
        [data appendBytes:loginName length:sizeof(loginName)];
        
        Byte code[16] = {'1','2','3','4'};
        [data appendBytes:code length:sizeof(code)];
        
        int v = 1;
        NSData *version = [BiggiFiUtil intToData:v];
        
        [data appendData:version];
        
        //tcp发送data
        [connect_Socket writeData:data withTimeout:2 tag:0];
        
        [connect_Socket readDataWithTimeout:-1 tag:0];
        
        }else{
        
            DDLog(@"登录成功请求当前VMG端的模式");
            
        }
    }
    if (sock == screenShot_Socket) {
        
        [screenShot_Socket readDataWithTimeout:-1 tag:0];
    }
}

//服务器连接失败

- (void)onSocket:(AsyncSocket *)sock willDisconnectWithError:(NSError *)err{
    
    
    
}
//断开
- (void)onSocketDidDisconnect:(AsyncSocket *)sock{
    
    
    short r= (short)CMD_REQ_VMA_MODE;
    NSData *byt = [BiggiFiUtil shortToData:r];
    [connect_Socket writeData:byt withTimeout:3. tag:0];
    [connect_Socket readDataWithTimeout:-1 tag:0];
    
}


//登陆返回数据
/**  根据获取的data的长度来判断
 *
 *
 */

- (void)onSocket:(AsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag
{
    if (sock==connect_Socket) {
        
        [connect_Socket readDataWithTimeout:-1 tag:0];
        NSUInteger len = [data length];
        Byte *byteData = (Byte*)malloc(len);
        memcpy(byteData, [data bytes], len);
        
        switch (len) {
            case 2:
                if (byteData[0]==CMD_IME_OPEN) {
                    
                }if (byteData[0]==CMD_IME_CLOSE) {
                    
                }
                break;
            case 4:{
                int ret = byteData[0];
                
                if (ret == 0){
                    
                    self.loginSuccess = YES;
                    
                }
                if (ret==28) {
                    DDLog(@"---开启--手柄模式---");
                }
                else  if (ret==250) {
                    
                    [connect_Socket setDelegate:nil];
                    [connect_Socket disconnect];
                    connect_Socket=nil;
                    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"连接达到上限" delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
                    [alert show];
                    [alert performSelector:@selector(dismissWithClickedButtonIndex:animated:) withObject:nil afterDelay:1];
                }
                free(byteData);
            }
                break;
            case 12:
            {
                //第二次返回数据：版本，type，ack
                int ret = byteData[0];
                if(ret==250) {

                    wifiConfigOkSocket =nil;
                    [wifiConfigOkSocket setDelegate:nil];
                    [wifiConfigOkSocket disconnect];
                    
                    connect_Socket = nil;
                    [connect_Socket setDelegate:nil];
                    [connect_Socket disconnect];
                    
                    DDLog(@"---版本限制----");
                    
                }else{
                    if (self.loginSuccess == YES) {
                        
                        NSArray *array = [BiggiFiUtil loginSucessData:data];
                        
                        
                        //区别公版和非公版
                        DDLog(@"Host Type is: %d", [[array objectAtIndex:1] intValue]);
                        if ([[array objectAtIndex:1] intValue]!= 13) {
                            //                            isCommonVersion = YES;
                            
                            wifiConfigOkSocket =nil;
                            [wifiConfigOkSocket setDelegate:nil];
                            [wifiConfigOkSocket disconnect];
                            
                            connect_Socket = nil;
                            [connect_Socket setDelegate:nil];
                            [connect_Socket disconnect];
                            
                            DDLog(@"版本限制");
                            
                        }
                        else {
                            
//                            isCommonVersion = NO;
                            short r= (short)CMD_REQ_VMA_MODE;
                            NSData *byt = [BiggiFiUtil shortToData:r];
                            [connect_Socket writeData:byt withTimeout:-1 tag:0];
                            if (self.loginSuccessBlock) {
                                self.loginSuccessBlock(YES);
                            }
                            
                            //发送当前遥控器的屏幕宽高
                            NSMutableData *sizeData = [NSMutableData data];
                            NSData *cmd = [BiggiFiUtil shortToData:CMD_RESOLUTION];
                            [sizeData appendData:cmd];
                            
                            NSData *width = [BiggiFiUtil intToData:DEVICWIDTH];
                            NSData *height = [BiggiFiUtil intToData:DEVICEHEIGH];
                            
                            [sizeData appendData:width];
                            [sizeData appendData:height];
                            
                            [connect_Socket writeData:sizeData withTimeout:-1 tag:0];
                            
                            NSData *sensorData = [BiggiFiUtil shortToData:CMD_SENSOR_START];
                            [connect_Socket writeData:sensorData withTimeout:-1 tag:0];
                            
                        }
                    }else{
                        
                        DDLog(@"没有响应");
                        
                    }
                    free(byteData);}
                
            }
                break;
            case 16:{
                NSArray *array = [BiggiFiUtil loginSucessData:data];
                NSInteger result = [[array objectAtIndex:0]intValue];
                if (result == 0) {
                    self.loginSuccess = YES;
                    if ([[array objectAtIndex:1] intValue]!= 13) {
                        //                            isCommonVersion = YES;
                        
                        wifiConfigOkSocket =nil;
                        [wifiConfigOkSocket setDelegate:nil];
                        [wifiConfigOkSocket disconnect];
                        
                        connect_Socket = nil;
                        [connect_Socket setDelegate:nil];
                        [connect_Socket disconnect];
                        
                        DDLog(@"版本限制");
                        
                    }else {
                        short r= (short)CMD_REQ_VMA_MODE;
                        NSData *byt = [BiggiFiUtil shortToData:r];
                        [connect_Socket writeData:byt withTimeout:-1 tag:0];
                        if (self.loginSuccessBlock) {
                            self.loginSuccessBlock(YES);
                        }
                        //发送当前遥控器的屏幕宽高
                        NSMutableData *sizeData = [NSMutableData data];
                        NSData *cmd = [BiggiFiUtil shortToData:CMD_RESOLUTION];
                        [sizeData appendData:cmd];
                        
                        NSData *width = [BiggiFiUtil intToData:DEVICWIDTH];
                        NSData *height = [BiggiFiUtil intToData:DEVICEHEIGH];
                        
                        [sizeData appendData:width];
                        [sizeData appendData:height];
                        
                        [connect_Socket writeData:sizeData withTimeout:-1 tag:0];
                        
                        NSData *sensorData = [BiggiFiUtil shortToData:CMD_SENSOR_START];
                        [connect_Socket writeData:sensorData withTimeout:-1 tag:0];
                    }
                    
                }
            }
                
                break;
            default:
                break;
        }
        
        
        DDLog(@"---------------");
        
    }
    //截屏
    if (sock == screenShot_Socket) {
        if ([data length] == 4) {
            //预保留
            jpgret = [BiggiFiUtil dataToInt:data];
        }else{
            if (jpgret > 0) {
                if (jpgData == nil) {
                    jpgData = [[NSMutableData alloc] init];
                }
                [jpgData appendData:data];
                jpgret = jpgret - data.length;
            }else if(jpgret == 0){
                jpgret = [BiggiFiUtil getImageSize:data];
                if (jpgData == nil) {
                    jpgData = [[NSMutableData alloc] init];
                }
                NSData *data1 = [data subdataWithRange:NSMakeRange(4, data.length -4)];
                [jpgData appendData:data1];
                jpgret = jpgret - data1.length;
            }
            if (jpgret == 0) {
                if (jpgData!=nil) {
                    self.screenImage = [UIImage imageWithData:jpgData];
//                    self.mainModel = [[MainModel alloc]init];
//                    self.mainModel.screenImage = image ;
                    screenShot_Socket = nil;
                }
            }
        }
    }


}

//--------------------------UDP--------------------------------
#pragma mark UDP

- (void)onUdpSocket:(AsyncUdpSocket *)sock didSendDataWithTag:(long)tag{
    
    if (sock==search_Socket) {
        [search_Socket receiveWithTimeout:5.0 tag:0];
        
    }else if (sock==vma_CheckSocket){
        [search_Socket receiveWithTimeout:-1 tag:0];
    }else if (sock==control_Socket){
        DDLog(@"======处于操作状态的=====");
    }
    
}

- (void)onUdpSocket:(AsyncUdpSocket *)sock didNotSendDataWithTag:(long)tag dueToError:(NSError *)error{
    
    
}


- (BOOL)onUdpSocket:(AsyncUdpSocket *)sock didReceiveData:(NSData *)data withTag:(long)tag fromHost:(NSString *)host port:(UInt16)port
{
    
    if (sock == search_Socket) {
        self.searchTimes++;
        //        DeviceModel *model = [[DeviceModel alloc]init];
        NSMutableDictionary *Dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        
        NSMutableDictionary* modelDic = [[NSMutableDictionary alloc] initWithDictionary:Dic];
        
        [modelDic setValue:host forKey:@"ipAddress"];
        
        [self.modelArray addObject:[DeviceModel DeviceInfoWithDict:modelDic]];
        
    }
    
    return NO;
}

- (void)onUdpSocket:(AsyncUdpSocket *)sock didNotReceiveDataWithTag:(long)tag dueToError:(NSError *)error
{
    if(sock == search_Socket){
        
        //需要做3次轮询搜索棒子 每次 5 秒
        
    }else if (sock==vma_CheckSocket){
        
        DDLog(@"------VMA----心跳不在-----");
        
    }
}

- (void)onUdpSocketDidClose:(AsyncUdpSocket *)sock{
    
    DDLog(@"-------%@-----",sock.description);
    
}


@end
