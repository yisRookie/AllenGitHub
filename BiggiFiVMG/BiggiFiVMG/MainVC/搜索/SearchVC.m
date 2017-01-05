//
//  SearchVC.m
//  BiggiFiVMG
//
//  Created by 峰 on 15/6/10.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import "SearchVC.h"
#import "MainControlVC.h"
#import "BiggiFiSocket.h"
#import "AI3Category.h"

@interface SearchVC ()

@end

@implementation SearchVC

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self receiveDataModelArrayAndTableViewLoadData];
    self.wifiName.text=[NSString stringWithFormat:@"当前的WiFi网络:%@",[BiggiFICategory fetchSSIDInfomation]];
    self.deviceTableView.tableFooterView=[[UIView alloc]init];
}
- (void)viewWillAppear:(BOOL)animated{
    
    [BiggiFICategory setDevicePortrait];
   
    self.navigationController.navigationBarHidden=YES;
    
}
//获取设备并刷新视图
- (void)receiveDataModelArrayAndTableViewLoadData{
    
    self.wifiName.text=[NSString stringWithFormat:@"当前的WiFi网络:%@",[BiggiFICategory fetchSSIDInfomation]];
    
    [CoreSVP showSVPWithType:CoreSVPTypeLoadingInterface Msg:@"搜索中" duration:5. allowEdit:NO beginBlock:^{
        [[BiggiFiSocket sharedInstance] searchDevice];
        
    } completeBlock:nil];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [CoreSVP dismiss];
        self.devicesArray = [BiggiFiSocket sharedInstance].modelArray;
        
        if (self.devicesArray.count==0) {
            
            self.tipLabel.text=@"未检测到您的电视设备，请确保在同一Wifi下再连接，或点击右上方刷新键";
            
        }else{
            self.tipLabel.text = @"点击右上角的刷新按钮再次搜索";
            [self.deviceTableView reloadData];
            
        }
    });
    
}

- (IBAction)refreshSearch:(id)sender {
    
    [self receiveDataModelArrayAndTableViewLoadData];
    
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
}

- (CGFloat)tableView:( UITableView *)tableView heightForHeaderInSection:( NSInteger )section{
    
    return  self.devicesArray.count == 0 ? 0.0 : 260.0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headView=[[UIView alloc]init];
    headView.frame = CGRectMake(0, 0, DEVICWIDTH,260);
    UIImageView *imageV=[[UIImageView alloc]initWithFrame:headView.bounds];
    imageV.image=[UIImage imageNamed:@"info"];
    [headView addSubview:imageV];
    return headView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellWithIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellWithIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellWithIdentifier];
    }
    
    UIImageView *cellimagV = [[UIImageView alloc]initWithFrame:cell.bounds];
    cellimagV.image=[UIImage imageNamed:@"cellback"];
    [cell addSubview:cellimagV];
    
    DeviceModel *model = [self.devicesArray objectAtIndex:indexPath.row ];
    cell.backgroundColor=[UIColor clearColor];
    cell.textLabel.textColor=[UIColor whiteColor];
    //FIXME:测试老棒子的时候需要
    cell.textLabel.text = model.HOSTNAME?model.HOSTNAME:@"老棒子";
    cell.textLabel.textAlignment=1;
    [cell.textLabel autoresizingMask];
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    DeviceModel *model = self.devicesArray[indexPath.row];
//    [CoreSVP showSVPWithType:CoreSVPTypeLoadingInterface Msg:@"连接中" duration:5. allowEdit:NO beginBlock:^{
//        //test 老版本的棒子的端口需要写死 17892
//        [[BiggiFiSocket sharedInstance]connectionDeviceBySocket:model.ipAddress onPort:[model.CMD_PORT unsignedIntegerValue]?[model.CMD_PORT unsignedIntegerValue]:17892];
//        
//    } completeBlock:nil];
    
//    [BiggiFiSocket sharedInstance].loginSuccessBlock =^(BOOL success){
//        
//        if (success) {
//            [CoreSVP dismiss];
//            MainControlVC *mainConVC = [[MainControlVC alloc]init];
//            mainConVC.ipAddress = model.ipAddress;
//            mainConVC.port = [model.CMD_PORT unsignedIntegerValue]?[model.CMD_PORT unsignedIntegerValue]:17892;
//            [self.navigationController pushViewController:mainConVC animated:NO];
//            
//        }else{
//            
//            
//        }
//    };
    
    MainControlVC *mainConVC = [[MainControlVC alloc]init];
//    mainConVC.ipAddress = model.ipAddress;
//    mainConVC.port = [model.CMD_PORT unsignedIntegerValue]?[model.CMD_PORT unsignedIntegerValue]:17892;
    [self.navigationController pushViewController:mainConVC animated:NO];

}


@end
