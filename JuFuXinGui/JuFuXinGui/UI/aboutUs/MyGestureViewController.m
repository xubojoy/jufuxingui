//
//  MyGestureViewController.m
//  JuFuXinGui
//
//  Created by mac on 15/1/5.
//  Copyright (c) 2015年 XB. All rights reserved.
//

#import "MyGestureViewController.h"
#import "HAN_Constants.h"
#import "AboutUsCell.h"
#import "AppDelegate.h"
#import "UserModel.h"
#define kLableArray @[@"创建密码", @"修改密码", @"清除密码",@"开启手势密码",@"关闭手势密码"]

@interface MyGestureViewController ()
{
    NSArray * titlearray;
    NSArray* heightArray;
}
@end

@implementation MyGestureViewController


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[NTViewController sharedController] hidesTabBar:YES animated:YES];
    if ([LLLockPassword loadLockPassword]) {
        if (self.user.isgesture==NO) {
            heightArray = @[@"0.0", @"50.0", @"50.0",@"50.0",@"0.0"];
        }else{
            heightArray = @[@"0.0", @"50.0", @"50.0",@"0.0",@"50.0"];
        }
        
    } else {
        heightArray = @[@"50.0", @"0.0", @"0.0",@"0.0",@"0.0"];
    }
    [self.tableview reloadData]; // ios6需要不然不刷新，8不要，7未验证
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.user=[UserModel shareuser];
    titlearray=@[@"创建密码手势",@""];
    [self setRightSwipeGesture];
    [self initHeader];
    [self initbody];
}

#pragma mark - 头部相关
//初始化头部
- (void)initHeader{
    //初始化布局与背景
    
    self.header  = [[HeaderView alloc] initWithTitle:@"手势密码" navigationController:self.navigationController];
    [self.view addSubview:self.header];
}

-(void)initbody{
    self.tableview=[[UITableView alloc]initWithFrame:CGRectMake(0,self.header.frame.size.height+10, Screen_weight,300) style:UITableViewStylePlain];
    self.tableview.scrollEnabled=NO;
    self.tableview.rowHeight=60;
    self.tableview.delegate=self;
    self.tableview.separatorStyle=UITableViewCellSeparatorStyleNone;
    self.tableview.dataSource=self;
    //self.tableview.backgroundColor=[UIColor lightGrayColor];
    [self.view addSubview:self.tableview];
    
}
#pragma mark UITableViewDataSource @required



#pragma mark - TableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return ((NSNumber*)(heightArray[indexPath.row])).floatValue;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * Identifier=@"Identifiercell";
    
    AboutUsCell * cell=[tableView dequeueReusableCellWithIdentifier:Identifier];
    if (!cell) {
        cell=[[AboutUsCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
        
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        cell.upLine=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, Screen_weight, 0.5)];
        cell.upLine.backgroundColor=[UIColor grayColor];
        [cell addSubview:cell.upLine];
        cell.lineView=[[UIView alloc]initWithFrame:CGRectMake(0, cell.frame.size.height-0.5, Screen_weight, 0.5)];
        cell.lineView.backgroundColor=[UIColor grayColor];
        [cell addSubview:cell.lineView];
        
        cell.clipsToBounds = YES;
    }
    cell.textLabel.text = kLableArray[indexPath.row];
//    static NSString* ident = @"SettingCell";
//    
//    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:ident forIndexPath:indexPath];
//    cell.textLabel.text = kLableArray[indexPath.row];
//    cell.clipsToBounds = YES;
    
   // return cell;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    AppDelegate* ad = (AppDelegate*)[UIApplication sharedApplication].delegate;
    switch (indexPath.row) {
        case 0:
            [ad showLLLockViewController:LLLockViewTypeCreate];
            break;
        case 1:
            [ad showLLLockViewController:LLLockViewTypeModify];
            break;
        case 2:
            [ad showLLLockViewController:LLLockViewTypeClean];

            break;
            case 3:
            [self getalert:@"开启手势密码"];
            break;
            case 4:
            [self getalert:@"关闭手势密码"];
            break;
        default:
            break;
            
    }
    
}
-(void)getalert:(NSString *)title{
    UIAlertView * alert=[[UIAlertView alloc]initWithTitle:@"温馨提示" message:title delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    if ([title isEqualToString:@"关闭手势密码"]) {
        alert.tag=1010;
    }else{
        alert.tag=2020;
    }
    
    [alert show];
}
#pragma mark UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    // NSUserDefaults * defaults=[NSUserDefaults standardUserDefaults];
    if (alertView.tag==1010) {
        if (buttonIndex==1) {
            self.user.isgesture=NO;
            //[defaults setBool:NO forKey:self.user.userName];
            heightArray = @[@"0.0", @"50.0", @"50.0",@"50.0",@"0.0"];
            [self.tableview reloadData];
        }
        
    }else{
        if (buttonIndex==1) {
            self.user.isgesture=YES;
            //[defaults setBool:YES forKey:self.user.userName];
            heightArray = @[@"0.0", @"50.0", @"50.0",@"0.0",@"50.0"];
            [self.tableview reloadData];
        }
        
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
