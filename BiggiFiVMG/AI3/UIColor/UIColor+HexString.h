//
//  UIColor+HexString.h
//
//  Created by Micah Hainline
//  http://stackoverflow.com/users/590840/micah-hainline
//

#import <UIKit/UIKit.h>

@interface UIColor (HexString)
/**
 *  16 进制颜色 传入 #XXXXXXX
 *
 *  @param hexString 3 4 8 位 数字
 *
 *  @return 颜色
 */
+ (UIColor *) colorWithHexString: (NSString *) hexString;

@end
