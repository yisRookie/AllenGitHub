//
//  SettingsVC.m
//  BiggiFiVMG
//
//  Created by 峰 on 15/6/10.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import "SettingsVC.h"
#import "DetailSettingsVC.h"

#define tableValue  @[@"鼠标设置",@"关于"]

@interface SettingsVC ()

@end

@implementation SettingsVC


-(void)viewWillAppear:(BOOL)animated{
    
    self.navigationController.navigationBarHidden=NO;



}

- (void)viewDidLoad {
    [super viewDidLoad];
//      [BiggiFICategory setDeviceLanLandscape];
    self.title =@"设置";
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"back"]];
    self.setTableV.tableFooterView = [[UIView alloc]init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return tableValue.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellWithIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellWithIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellWithIdentifier];
    }
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.text = tableValue[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];//取消选中项
    
    if (indexPath.row==1) {
        DetailSettingsVC *detailVC = [[DetailSettingsVC alloc]initWithNibName:@"DetailSettingsVC" bundle:nil];
        [self.navigationController pushViewController:detailVC animated:YES];
    }
    
}

@end
