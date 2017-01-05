//
//  UIButton+Block.h
//  IOS-Categories
//
//  Created by Jakey on 14/12/30.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^TouchedBlock)(NSInteger tag);

@interface UIButton (Block)
/**
 *  @brief  ButtonBlock
 *
 *  @param touchHandler touchHandler description
 */
-(void)addActionHandler:(TouchedBlock)touchHandler;
@end
