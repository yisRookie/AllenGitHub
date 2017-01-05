//
//  DeviceModel.m
//  BiggiFiVMG
//
//  Created by 峰 on 15/6/10.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import "DeviceModel.h"

@implementation DeviceModel


- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        
        self.HOSTNAME = dict[@"HOSTNAME"];
        self.VERSION = dict[@"VERSION"];
        self.PAYMENT_CMD_PORT = dict[@"PAYMENT_CMD_PORT"];
        self.SCRSHOTSC_PORT = dict[@"SCRSHOTSC_PORT"];
        self.LEVEL = dict[@"LEVEL"];
        self.SDK_CMD_PORT = dict[@"SDK_CMD_PORT"];
        self.CMD_PORT = dict[@"CMD_PORT"];
        self.ipAddress = dict[@"ipAddress"];
        
    }
    return self;
}

+ (instancetype)DeviceInfoWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}


@end
