//
//  BiggiFiUtil.h
//  BiggiFiVMGPlus
//
//  Created by ying xiang on 13-2-21.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BiggiFiUtil : NSObject


+(NSData*)shortToData:(short) number;

+(NSData*)intToData:(int) number;

+(NSData*)intToDataJava:(int) number;

+(NSData*)floatToData:(float) number;

+(int)dataToInt:(NSData*)data;

+(int)dataToIntJava:(NSData*)data;

+(int)multiply:(int)data ratio:(int)ratio;

+(NSArray *)loginSucessData:(NSData *)data;

+(int)getImageSize:(NSData *)data;


@end
