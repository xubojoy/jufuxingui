//
//  CashViewController.m
//  JuFuXinGui
//
//  Created by mac on 14/12/29.
//  Copyright (c) 2014年 XB. All rights reserved.
//

#import "CashViewController.h"
#import "HAN_Constants.h"
#import "TiXianViewController.h"
#import "UserModel.h"
@interface CashViewController ()

@end

@implementation CashViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.user=[UserModel shareuser];
    [self setRightSwipeGesture];
    [self initHeader];
    [self initbody];
    //Do any additional setup after loading the view from its nib.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[NTViewController sharedController] hidesTabBar:YES animated:YES];
}
#pragma mark - 头部相关
//初始化头部
- (void)initHeader{
    //初始化布局与背景
    self.header  = [[HeaderView alloc] initWithTitle:@"我的财富" navigationController:self.navigationController];
    self.header.backBut.hidden = NO;
    [self.view addSubview:self.header];
}
- (void)initbody{
    UILabel * linelabel1=[[UILabel alloc]initWithFrame:CGRectMake(0,0, screen_width,0.5)];
    linelabel1.backgroundColor=linecolor;
    linelabel1.alpha=0.8;
    UIView * view=[[UIView alloc]initWithFrame:CGRectMake(0, self.header.frame.size.height+20, screen_width,LoginViewController_uerview_height)];
    view.backgroundColor=[UIColor whiteColor];
    UILabel * namelabel=[[UILabel alloc]initWithFrame:CGRectMake(15,5,80, 40)];
    namelabel.text=@"提现金额";
    namelabel.font=[UIFont systemFontOfSize:18];
    namelabel.textColor=[UIColor blackColor];
    namelabel.textAlignment=NSTextAlignmentLeft;
    [view addSubview:namelabel];
    UILabel * pwdlabel=[[UILabel alloc]initWithFrame:CGRectMake(15,55,100, 40)];
    pwdlabel.text=@"可提现金额";
    pwdlabel.font=[UIFont systemFontOfSize:18];
    pwdlabel.textColor=[UIColor blackColor];
    pwdlabel.textAlignment=NSTextAlignmentLeft;
    [view addSubview:pwdlabel];
    UILabel * pwdlabel1=[[UILabel alloc]initWithFrame:CGRectMake(pwdlabel.frame.size.width+10,55,110, 40)];
    pwdlabel1.text=@"提现金额(免手续费)";
    pwdlabel1.font=[UIFont systemFontOfSize:12];
    pwdlabel1.textColor=[UIColor lightGrayColor];
    pwdlabel1.textAlignment=NSTextAlignmentLeft;
    [view addSubview:pwdlabel1];
    self.cashfield=[[UITextField alloc]initWithFrame:CGRectMake(Screen_weight-60,5,100, 40)];
    self.cashfield.keyboardType=UIKeyboardTypeNumberPad;
    self.cashfield.placeholder=@"¥100";
    [view addSubview:self.cashfield];
    
    //工具栏
    UIToolbar * toolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, Screen_weight, Screen_height/15)];
    toolbar.backgroundColor = [UIColor lightGrayColor];
    UIBarButtonItem*  doneBtn = [[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(doneAction)];
    UIBarButtonItem * btnSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    NSArray * buttonsArray = [NSArray arrayWithObjects:btnSpace, doneBtn, nil];
    [toolbar setItems:buttonsArray];
    self.cashfield.inputAccessoryView = toolbar;
    self.cashfield.delegate=self;
    self.rcachfield=[[UITextField alloc]initWithFrame:CGRectMake(Screen_weight-60,55,80,40)];
    self.rcachfield.placeholder=[NSString stringWithFormat:@"¥%@",self.user.money];;
    [view addSubview:self.rcachfield];
    self.rcachfield.delegate=self;
    self.rcachfield.inputAccessoryView=toolbar;
    self.rcachfield.userInteractionEnabled=NO;
    NSString * stg=self.rcachfield.placeholder;
    UILabel * linelabel13=[[UILabel alloc]initWithFrame:CGRectMake(self.rcachfield.frame.origin.x,self.rcachfield.frame.size.height+45,stg.length*10,0.5)];
    linelabel13.backgroundColor=linecolor;
    linelabel13.alpha=0.8;
    [view addSubview:linelabel13];
    UILabel * linelabel2=[[UILabel alloc]initWithFrame:CGRectMake(15,50, screen_width-30,0.5)];
    linelabel2.backgroundColor=linecolor;
    linelabel2.alpha=0.8;
    UILabel * linelabel3=[[UILabel alloc]initWithFrame:CGRectMake(0,100, screen_width,0.5)];
    linelabel3.backgroundColor=linecolor;
    linelabel3.alpha=0.8;
    [view addSubview:linelabel1];
    [view addSubview:linelabel2];
    [view addSubview:linelabel3];
    [self.view addSubview:view];
    
    
    UILabel * label=[[UILabel alloc]initWithFrame:CGRectMake(30, view.frame.size.height+view.frame.origin.y+6, Screen_weight-60, 30)];
    label.text=@"提现金额默认至本人银行卡";
    label.textColor=[UIColor lightGrayColor];
    label.font=[UIFont systemFontOfSize:13];
    [self.view addSubview:label];
    UIButton * logbtn=[UIButton buttonWithType:UIButtonTypeCustom];
    logbtn.frame=CGRectMake(15,label.frame.size.height+label.frame.origin.y+20, screen_width-30,LoginViewController_logbtn_height);
    logbtn.backgroundColor=RGBACOLOR(251, 44, 55, 1);
    [logbtn setTitle:@"提现" forState:UIControlStateNormal];
    logbtn.layer.cornerRadius=3;
    [self.view addSubview:logbtn];
    [logbtn addTarget:self action:@selector(logclick:) forControlEvents:UIControlEventTouchUpInside];
   
    
    
    
    
    
}
-(void)doneAction{
    [self.view endEditing:YES];
}
- (void)logclick:(UIButton *)sender{
    NSLog(@"提现");
    TiXianViewController * tixian=[[TiXianViewController alloc]init];
    [self presentViewController:tixian animated:YES completion:nil];
    
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
