//
//  BiggiFiUtil.m
//  BiggiFiVMGPlus
//
//  Created by ying xiang on 13-2-21.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "BiggiFiUtil.h"

@implementation BiggiFiUtil

+(NSData*)shortToData:(short) number{
    Byte a = (Byte)(number>>8)&0xFF;
    Byte b = (Byte)(number&0xFF);
    Byte byte[2] = {b,a};

    NSData *data = [NSData dataWithBytes:byte length:sizeof(byte)];
    return data;
}


+(NSData*)intToData:(int) number{
    Byte a1 = (Byte)((number>>24)&0xFF);
    Byte a2 = (Byte)((number>>16)&0xFF);
    Byte a3 = (Byte)((number>>8)&0xFF);
    Byte a4 = (Byte)(number&0xFF);
    Byte byte[4] = {a4,a3,a2,a1};
    
    NSData *data = [NSData dataWithBytes:byte length:sizeof(byte)];
    return data;
}

+(NSData*)intToDataJava:(int) number{
    Byte a1 = (Byte)((number>>24)&0xFF);
    Byte a2 = (Byte)((number>>16)&0xFF);
    Byte a3 = (Byte)((number>>8)&0xFF);
    Byte a4 = (Byte)(number&0xFF);
    Byte byte[4] = {a1,a2,a3,a4};
    
    NSData *data = [NSData dataWithBytes:byte length:sizeof(byte)];
    return data;
}

+(int)dataToInt:(NSData*)data{
    Byte *byte = (Byte *)[data bytes];
    int a = 0,b = 0,c = 0,d = 0,ret = 0;
    for(int i = 0; i<[data length];i++)
    {
        if(i%4 == 0)
            a = byte[i];
        else if(i%4 == 1)
            b = byte[i];
        else if(i%4 == 2)
            c = byte[i];
        else if(i%4 == 3)
            d = byte[i];
        
        if(i%4 == 3)
        {
            ret = ((d<<24)&0xFF000000);
            ret |= ((c<<16)&0xFF0000);
            ret |= ((b<<8)&0xFF00);
            ret |= (a&0xFF);
        }
    }

    return ret;
}

+(int)dataToIntJava:(NSData*)data{
    Byte *byte = (Byte *)[data bytes];
    int a = 0,b=0,c=0,d=0,ret = 0;
    for(int i = 0; i<[data length];i++)
    {
        if(i%4 == 0)
            a = byte[i];
        else if(i%4 == 1)
            b = byte[i];
        else if(i%4 == 2)
            c = byte[i];
        else if(i%4 == 3)
            d = byte[i];
        
        if(i%4 == 3)
        {
            ret = ((a<<24)&0xFF000000);
            ret |= ((b<<16)&0xFF0000);
            ret |= ((c<<8)&0xFF00);
            ret |= (d&0xFF);
        }
    }
    
    return ret;
}

+(NSData*)floatToData:(float) number{
    NSData *data = [NSData dataWithBytes:&number length:sizeof(number)];
    return data;
}

+(int)multiply:(int)data ratio:(int)ratio{
    int ret;
    
    switch (ratio) {
		case 0:
			ret = 0;
			break;
		case 1:
			ret = data; // no changes
			break;
		case 2:
			ret = data << 1; // == 'data * 2';
			break;
		case 3:
			ret = (data << 1) + data; // == 'data * 3'
			break;
		case 4:
			ret = data << 2; // == 'data * 4'
			break;
		case 5:
			ret = (data << 2) + data; // == 'data * 5'
			break;
		case 6:
			ret = (data << 2) + (data << 1); // == 'data * 6'
			break;
		case 7:
			ret = (data << 2) + (data << 1) + data; // == 'data * 7'
			break;
		case 8:
			ret = data << 3; // == 'data * 8'
			break;
		case 9:
			ret = (data << 3) + data; // == 'data * 9'
			break;
		case 10:
			ret = (data << 3) + (data << 1); // == 'data * 10'
			break;
		default:
			ret = data;
			break;
    }
    
    return ret;
}

+(NSArray *)loginSucessData:(NSData *)data
{
    NSMutableArray *result = [NSMutableArray array];
    Byte *byte = (Byte *)[data bytes];
    int a=0,b=0,c=0,d=0;
    for(int i = 0; i<[data length];i++)
    {
           if(i%4 == 0)
            a = byte[i];
        else if(i%4 == 1)
            b = byte[i];
        else if(i%4 == 2)
            c = byte[i];
        else if(i%4 == 3)
            d = byte[i];
        
        if(i%4 == 3)
        {
            int ret = ((d<<24)&0xFF000000);
            ret |= ((c<<16)&0xFF0000);
            ret |= ((b<<8)&0xFF00);
            ret |= (a&0xFF);
            
            NSNumber *number = [NSNumber numberWithInt:ret];
            [result addObject:number];
        }
    }
    return result;
}

+(int)getImageSize:(NSData *)data
{
    Byte *byte = (Byte *)[data bytes];
    int a,b,c,d,ret = 0;
    
    a = byte[0];
    b = byte[1];
    c = byte[2];
    d = byte[3];
    
    ret = ((d<<24)&0xFF000000);
    ret |= ((c<<16)&0xFF0000);
    ret |= ((b<<8)&0xFF00);
    ret |= (a&0xFF);
    
    return ret;
}

@end
