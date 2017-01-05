//
//  DeviceModel.h
//  BiggiFiVMG
//
//  Created by 峰 on 15/6/10.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface DeviceModel : NSObject

@property (strong ,nonatomic) NSString *HOSTNAME;
@property (strong ,nonatomic) NSNumber *VERSION;
@property (strong ,nonatomic) NSNumber *PAYMENT_CMD_PORT;
@property (strong ,nonatomic) NSNumber *SCRSHOTSC_PORT;
@property (strong ,nonatomic) NSNumber *LEVEL;
@property (strong ,nonatomic) NSNumber *SDK_CMD_PORT;
@property (strong ,nonatomic) NSNumber *CMD_PORT;
@property (strong ,nonatomic) NSString *ipAddress;


- (instancetype)initWithDict:(NSDictionary *)dict;

+ (instancetype)DeviceInfoWithDict:(NSDictionary *)dict;


@end