//
//  SearchVC.h
//  BiggiFiVMG
//
//  Created by 峰 on 15/6/10.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BiggiFiViewController.h"

@interface SearchVC : BiggiFiViewController<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *devicesArray;

@property (weak, nonatomic) IBOutlet UILabel *wifiName;

@property (weak, nonatomic) IBOutlet UITableView *deviceTableView;

@property (weak, nonatomic) IBOutlet UILabel *tipLabel;


@end
