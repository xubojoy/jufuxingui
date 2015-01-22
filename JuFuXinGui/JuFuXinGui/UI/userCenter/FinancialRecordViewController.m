//
//  FinancialRecordViewController.m
//  JuFuXinGui
//
//  Created by mac on 14/12/30.
//  Copyright (c) 2014年 XB. All rights reserved.
//

#import "FinancialRecordViewController.h"
#import "HAN_Constants.h"
#import "ChongzhiViewController.h"
#import "UserModel.h"
#import "TiXianViewController.h"
@interface FinancialRecordViewController ()
{
    NSArray * titlearray;
    NSMutableArray * titleArray;
    NSMutableArray * shouzhiarray;
    NSMutableArray * addarray;
    NSMutableArray * lostarray;
    BOOL isload;
}
@end

@implementation FinancialRecordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.user=[UserModel shareuser];
    
    titlearray = @[@"充值",@"购买项目"];
    isload=NO;
    [self getjilu];
    addarray=[[NSMutableArray alloc]initWithCapacity:0];
    lostarray=[[NSMutableArray alloc]initWithCapacity:0];
    shouzhiarray=[[NSMutableArray alloc]initWithCapacity:0];
    titleArray=[[NSMutableArray alloc]initWithCapacity:0];
    self.view.frame=CGRectMake(0,0,Screen_weight, Screen_height);
    self.view.backgroundColor=RGBACOLOR(232, 232, 232, 1);
    [self initbody];
    // Do any additional setup after loading the view from its nib.
}
- (void)initbody{
    /*
     账户余额
     */

    
    
    UILabel * linelabel1=[[UILabel alloc]initWithFrame:CGRectMake(0,0,Screen_weight,0.5)];
    linelabel1.backgroundColor=linecolor;
    linelabel1.alpha=0.8;
    UIView * view=[[UIView alloc]initWithFrame:CGRectMake(0,0,Screen_weight,60)];
    view.backgroundColor=[UIColor whiteColor];
    
    UILabel * line=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, Screen_weight, 0.5)];
    line.backgroundColor=[UIColor lightGrayColor];
    [view addSubview:line];
    UIButton * logbtn=[UIButton buttonWithType:UIButtonTypeCustom];
    logbtn.frame=CGRectMake(15,20,Screen_weight-30,LoginViewController_logbtn_height);
    logbtn.backgroundColor=RGBACOLOR(251, 44, 55, 1);
    [logbtn setTitle:@"充值" forState:UIControlStateNormal];
    logbtn.layer.cornerRadius=3;
    [view addSubview:logbtn];
    [logbtn addTarget:self action:@selector(logclick:) forControlEvents:UIControlEventTouchUpInside];
    
    self.tableview=[[UITableView alloc]initWithFrame:CGRectMake(0,0,Screen_weight,Screen_height-self.header.frame.size.height-view.frame.size.height-50)];
    self.tableview.delegate=self;
    self.tableview.dataSource=self;
    self.tableview.separatorStyle=UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableview];
    //self.tableview.tableHeaderView=firstview;
    self.tableview.tableFooterView=view;
    
    
    
}


#pragma mark 充值按钮事件
-(void)logclick:(UIButton *)sender{
    
    
    TiXianViewController * cashvc=[[TiXianViewController alloc]init];
   // ChongzhiViewController * cash=[[ChongzhiViewController alloc]init];
    UIWindow * window=[UIApplication sharedApplication].keyWindow;
    [window.rootViewController presentViewController:cashvc animated:YES completion:nil];
}
-(void)doneAction{
    [self.view endEditing:YES];
}
#pragma mark UITableViewDataSource @required
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (isload==NO) {
        return 1;
    }else{
        return 2;
    }
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 1;
    }else{
        return addarray.count+lostarray.count;
    }
   
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * Identifier=@"Identifier";
    UITableViewCell * cell=[tableView dequeueReusableCellWithIdentifier:Identifier];
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        UILabel * label=[[UILabel alloc]initWithFrame:CGRectMake(Screen_weight-150,0,140 ,40)];
        label.textColor=[UIColor lightGrayColor];
        label.textAlignment=NSTextAlignmentRight;
        label.tag=202020;
        [cell addSubview:label];
        UILabel * line=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, Screen_weight, 0.5)];
        line.backgroundColor=[UIColor lightGrayColor];
        [cell addSubview:line];
        
    }
    
    UILabel * label=(UILabel *)[cell viewWithTag:202020];
    ;
    if (indexPath.section==0) {
        cell.textLabel.text=@"用户余额";
        label.text=@"";
        label.text=[NSString stringWithFormat:@"¥%@",self.user.money];
    }else{
        label.text=@"";
        label.text=[[shouzhiarray objectAtIndex:indexPath.row] objectForKey:@"money"];
        if (indexPath.row<addarray.count) {
            cell.textLabel.text=@"充值";
        }else{
            cell.textLabel.text=@"购买项目";

        }
        
    }
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return 20;
    }else{
        return 30;
    }
    
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, Screen_weight,tableView.sectionHeaderHeight)];
    view.backgroundColor=RGBACOLOR(226, 226, 226, 1);
    if (section==1) {
        // [self.view addSubview:firstview];
        /*
         收支
         */
        UILabel * labelshou=[[UILabel alloc]initWithFrame:CGRectMake(15,0,140, 40)];
        labelshou.text=@"收支记录";
        labelshou.font=[UIFont systemFontOfSize:14];
        labelshou.textColor=[UIColor lightGrayColor];
        [view addSubview:labelshou];

        
    }
    UILabel * line=[[UILabel alloc]initWithFrame:CGRectMake(0, 0,Screen_weight,0.5)];
    line.backgroundColor=[UIColor lightGrayColor];
    [view addSubview:line];
    UILabel * line1=[[UILabel alloc]initWithFrame:CGRectMake(0,view.frame.size.height-1,Screen_weight, 0.5)];
    line1.backgroundColor=[UIColor lightGrayColor];
    if (Screen_weight!=320) {
        [view addSubview:line1];
    }
   //
    return view;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark 网络请求
-(void)getjilu{
    __weak FinancialRecordViewController * weeksafa=self;
    HAN_HttpRequest * request=[HAN_HttpRequest defaultRequest];
    [request getmoneyDataWithpage:0 token:self.user.token SuccessBlock:^(id data) {
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            
            dispatch_async(dispatch_get_main_queue(), ^{
               
                NSDictionary * dic=(NSDictionary *)data;
                [weeksafa getdata:dic];
                
            });
        });
   
    } WithFailBlock:^(NSError *error) {
        
    }];
}
-(void)getdata:(NSDictionary *)dic{
    if ([[dic objectForKey:@"code"] isEqualToString:@"01"]) {
        isload=YES;
        NSDictionary * dicc=[dic objectForKey:@"result"];
       
        addarray=[dicc objectForKey:@"addtime"];
        lostarray=[dicc objectForKey:@"losttime"];
        for (int i=0; i<addarray.count; i++) {
            NSString * string=[addarray objectAtIndex:i];
            NSArray * arrayq=[string componentsSeparatedByString:@","];
            NSString * time=[arrayq objectAtIndex:0];
            NSString * money=[arrayq objectAtIndex:1];
            NSDictionary * addic=[[NSDictionary alloc]initWithObjectsAndKeys:time,@"time",money,@"money",nil];
            [shouzhiarray addObject:addic];
            
        }
        
        for (int i=0; i<lostarray.count; i++) {
            NSString * string=[lostarray objectAtIndex:i];
            NSArray * arrayq=[string componentsSeparatedByString:@","];
            NSString * time=[arrayq objectAtIndex:0];
            NSString * money=[arrayq objectAtIndex:1];
            NSDictionary * addic=[[NSDictionary alloc]initWithObjectsAndKeys:time,@"time",money,@"money",nil];
            [shouzhiarray addObject:addic];
        }
       
    }else if([[dic objectForKey:@"code"] isEqualToString:@"00"]){
        isload=NO;
    }
    [self.tableview reloadData];
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
