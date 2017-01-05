//
//  UIView+Screenshot.m
//  BiggiFiVMG
//
//  Created by 峰 on 15/7/22.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import "UIView+Screenshot.h"

@implementation UIView (Screenshot)

-(UIImage *)screenShotImage {
    
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, [UIScreen mainScreen].scale);
    // IOS7及其后续版本
    if ([self respondsToSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)]) {
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:
                                    [self methodSignatureForSelector:
                                     @selector(drawViewHierarchyInRect:afterScreenUpdates:)]];
        [invocation setTarget:self];
        [invocation setSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)];
        CGRect arg2 = self.bounds;
        BOOL arg3 = YES;
        [invocation setArgument:&arg2 atIndex:2];
        [invocation setArgument:&arg3 atIndex:3];
        [invocation invoke];
    } else { // IOS7之前的版本
        [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    }
    
    UIImage *screenshot = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return screenshot;
}
@end
