//
//  SettingManagement.m
//  BiggiFiVMG
//
//  Created by 峰 on 15/6/18.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import "SettingManagement.h"

@interface SettingManagement(private)



@end

@implementation SettingManagement
@synthesize setDic;

+(SettingManagement*)instance{
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
        [self readPlist];
    }
    return  self;
}

-(void)readPlist{

    setDic = [[NSMutableDictionary alloc] initWithDictionary:[[NSUserDefaults standardUserDefaults] objectForKey:@"AllDefaultKey"]];
    
}

-(void)updateList{
    
    [[NSUserDefaults standardUserDefaults] setObject:setDic forKey:@"AllDefaultKey"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}


@end
