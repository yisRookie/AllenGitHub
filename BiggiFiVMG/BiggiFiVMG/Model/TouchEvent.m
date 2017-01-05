//
//  TouchEvent.m
//  BiggiFiVMG
//
//  Created by 峰 on 15/6/18.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import "TouchEvent.h"

@implementation TouchEvent
@synthesize eventID,touch;

-(id)init
{
    if(self = [super init])
    {
        touch = [[UITouch alloc] init];
        eventID = 0;
    }
    return self;
}
@end
