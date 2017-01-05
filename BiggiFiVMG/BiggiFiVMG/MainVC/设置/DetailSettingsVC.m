//
//  DetailSettingsVC.m
//  BiggiFiVMG
//
//  Created by 峰 on 15/6/12.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import "DetailSettingsVC.h"

#define DataSource @[@[@"版本:1.0.0",@"日期:2015-7-15"],@[@"意见反馈",@"QQ:234631578",@"邮箱:philip@bigifi.com"],@[@"版权"]]

@interface DetailSettingsVC ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *detailTable;

@end

@implementation DetailSettingsVC

//-(void)viewWillAppear:(BOOL)animated{
//
//    self.navigationController.navigationBarHidden=NO;
//
//    [BiggiFICategory setDeviceLanLandscape];
////    NSArray *AA=@[@[@"版本:1.0.0",@"日期:2015-7-15"],@[@"意见反馈",@"QQ:234631578",@"邮箱:philip@bigifi.com"],@[@"版权"]];
//
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"关于";
//    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"back"]];
//    UIImageView *imageV = [[UIImageView alloc]initWithFrame:self.view.bounds];
//    imageV.image = [UIImage imageNamed:@"back"];
//    [self.view insertSubview:imageV belowSubview:self.detailTable];
    
    self.detailTable.backgroundView.backgroundColor = [UIColor clearColor];
    self.detailTable.backgroundColor = [UIColor clearColor];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
    
}
- (CGFloat)tableView:( UITableView *)tableView heightForHeaderInSection:( NSInteger )section{
    
    return section ==0?55:10;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section==0) {
        UIView *headV = [[UIView alloc]initWithFrame:CGRectMake(0, 0,tableView.frame.size.width, 55)];
        UIImageView *imageV = [[UIImageView alloc]init];
        imageV.frame = CGRectMake(0, 0, 178, 55);
        imageV.center = headV.center;
        [headV addSubview:imageV];
        imageV.image = [UIImage imageNamed:@"logo"];
        return headV;
    }
    return nil;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    switch (section) {
        case 0:
            return 2;
            break;
        case 1:
            return 3;
            break;
        case 2:
            return 1;
            break;
        default:
            break;
    }
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellWithIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellWithIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellWithIdentifier];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.text = DataSource[indexPath.section][indexPath.row];
    cell.textLabel.textAlignment = 1;
    return cell;
}


/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
