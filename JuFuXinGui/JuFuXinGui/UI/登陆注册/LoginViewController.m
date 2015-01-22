//
//  LoginViewController.m
//  JuFuXinGui
//
//  Created by mac on 14/12/26.
//  Copyright (c) 2014年 XB. All rights reserved.
//

#import "LoginViewController.h"
#import "HAN_Constants.h"
#import "RegisterViewController.h"
#import "UserModel.h"
#import <CommonCrypto/CommonCrypto.h>
@interface LoginViewController ()

@end

@implementation LoginViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"login" object:nil];;
    nametext.text=self.user.userName;
    pwdtext.text=self.user.pwd;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.user=[UserModel shareuser];
    self.view.backgroundColor =RGBACOLOR(236, 236, 236,1);
    [self initHeader];
    [self initbackBtn];
    [self initbody];
}

#pragma mark - 头部相关
//初始化头部
- (void)initHeader{
    //初始化布局与背景
    self.header  = [[HeaderView alloc] initWithTitle:@"登陆" navigationController:self.navigationController];
    self.header.backBut.hidden = YES;
    [self.view addSubview:self.header];
}
-(void)initbackBtn{
    
    UIButton *shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    shareBtn.frame = CGRectMake(0, 20, 44, 43.5);
    shareBtn.backgroundColor = [UIColor clearColor];
    [shareBtn addTarget:self action:@selector(backBtnPress:) forControlEvents:UIControlEventTouchUpInside];
    [shareBtn setTitle:@"返回" forState:UIControlStateNormal];
    [self.header addSubview:shareBtn];
}
-(void)backBtnPress:(UIButton *)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)initbody{
    UILabel * linelabel1=[[UILabel alloc]initWithFrame:CGRectMake(0,0, screen_width,0.5)];
    linelabel1.backgroundColor=linecolor;
    linelabel1.alpha=0.8;
    UIView * view=[[UIView alloc]initWithFrame:CGRectMake(0, self.header.frame.size.height+20, screen_width,LoginViewController_uerview_height)];
    view.backgroundColor=[UIColor whiteColor];
    UILabel * namelabel=[[UILabel alloc]initWithFrame:CGRectMake(15, 5,60, 40)];
    namelabel.text=@"账户";
    namelabel.font=[UIFont systemFontOfSize:18];
    namelabel.textColor=[UIColor blackColor];
    namelabel.textAlignment=NSTextAlignmentLeft;
    [view addSubview:namelabel];
    UILabel * pwdlabel=[[UILabel alloc]initWithFrame:CGRectMake(15,55,80, 40)];
    pwdlabel.text=@"登陆密码";
    pwdlabel.font=[UIFont systemFontOfSize:18];
    pwdlabel.textColor=[UIColor blackColor];
    pwdlabel.textAlignment=NSTextAlignmentLeft;
    [view addSubview:pwdlabel];

    
    nametext=[[UITextField alloc]initWithFrame:CGRectMake(View_SizeW(pwdlabel)+15,5,Screen_weight-View_SizeW(pwdlabel)-30, 40)];
    nametext.text=self.user.userName;
    nametext.keyboardType=UIKeyboardTypeNumberPad;
    nametext.placeholder=@"请输入手机号";
    [view addSubview:nametext];
    
    //工具栏
    UIToolbar * toolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, Screen_weight, Screen_height/15)];
    toolbar.backgroundColor = [UIColor lightGrayColor];
    UIBarButtonItem*  doneBtn = [[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(doneAction)];
    UIBarButtonItem * btnSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    NSArray * buttonsArray = [NSArray arrayWithObjects:btnSpace, doneBtn, nil];
    [toolbar setItems:buttonsArray];
    nametext.inputAccessoryView = toolbar;
    nametext.delegate=self;
    
    
    pwdtext=[[UITextField alloc]initWithFrame:CGRectMake(View_SizeW(pwdlabel)+15,55,Screen_weight-View_SizeW(pwdlabel)-30,40)];
    pwdtext.text=self.user.pwd;
    pwdtext.placeholder=@"请输入密码";
    [view addSubview:pwdtext];
    pwdtext.delegate=self;
    pwdtext.secureTextEntry  = YES;
    pwdtext.inputAccessoryView=toolbar;
    
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
    
    UIButton * logbtn=[UIButton buttonWithType:UIButtonTypeCustom];
    logbtn.frame=CGRectMake(15,view.frame.size.height+view.frame.origin.y+20, screen_width-30,LoginViewController_logbtn_height);
    logbtn.backgroundColor=RGBACOLOR(251, 44, 55, 1);
    [logbtn setTitle:@"登陆" forState:UIControlStateNormal];
    logbtn.layer.cornerRadius=3;
    [self.view addSubview:logbtn];
    [logbtn addTarget:self action:@selector(logclick:) forControlEvents:UIControlEventTouchUpInside];
    UIButton * registerbtn=[UIButton buttonWithType:UIButtonTypeCustom];
    registerbtn.frame=CGRectMake(15,logbtn.frame.size.height+logbtn.frame.origin.y+20,100,LoginViewController_logbtn_height);
    registerbtn.backgroundColor=[UIColor clearColor];
    [registerbtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [registerbtn setTitle:@"快速注册" forState:UIControlStateNormal];
    [registerbtn addTarget:self action:@selector(registerclick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registerbtn];
    
    
    UILabel * label=[[UILabel alloc]initWithFrame:CGRectMake(screen_width-120, logbtn.frame.size.height+logbtn.frame.origin.y+20,150, LoginViewController_logbtn_height)];
    label.text=@"请到网站找回";
    UIButton * btnlabel=[UIButton buttonWithType:UIButtonTypeCustom];
    [btnlabel setTitle:@"找回密码          " forState:UIControlStateNormal];
    
    btnlabel.frame=CGRectMake(screen_width-120, logbtn.frame.size.height+logbtn.frame.origin.y+20,150, LoginViewController_logbtn_height);
    [self.view addSubview:btnlabel];
    [btnlabel setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [btnlabel addTarget:self action:@selector(goweb) forControlEvents:UIControlEventTouchUpInside];
    label.textColor=[UIColor grayColor];
    //[self.view addSubview:label];
    
    
}
-(void)goweb{
    UIAlertView * alert=[[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"您确定要去网站找回密码吗？" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    alert.tag=2010;
    [alert show];
}
-(void)doneAction{
    [self.view endEditing:YES];
}
-(void)logclick:(UIButton *)sender{
    NSLog(@"登陆");
    if ([nametext.text isEqualToString:@""]||[pwdtext.text isEqualToString:@""]) {
        
        [self getalert:@"信息完整度不够"];
        
    }else{
        
        [self denglu];
//        self.user.isLoad=YES;
//        [self dismissViewControllerAnimated:YES completion:nil];
    }
}
#pragma mark 登陆请求
-(void)denglu{
    HAN_HttpRequest * request=[HAN_HttpRequest defaultRequest];
    __weak LoginViewController * weeksafa=self;
   //NSString * name=[self md5:nametext.text];
    NSString * pwd=[self md5:pwdtext.text];
   [request getLoginWithName:nametext.text pwd:pwd SuccessBlock:^(id data) {
       dispatch_async(dispatch_get_main_queue(), ^{
           NSDictionary * dic=(NSDictionary *)data;
           if ([[dic objectForKey:@"code"] isEqualToString:@"01"]) {
               [weeksafa.user goout];
               weeksafa.user.isLoad=YES;
               
               NSString *token = [dic objectForKey:@"token"];
               [UserModel shareuser].token=token;
               weeksafa.user.userimage=[[dic objectForKey:@"result"] objectForKey:@"picurl"];
               weeksafa.user.idcard=[[dic objectForKey:@"result"] objectForKey:@"idcard"];
               NSString *userid = [[dic objectForKey:@"result"] objectForKey:@"id"];
               [UserModel shareuser].userid= userid;
               // [[NSUserDefaults standardUserDefaults] setObject:userid forKey:@"userid"];
               weeksafa.user.userName=[[dic objectForKey:@"result"] objectForKey:@"username"];
               
               weeksafa.user.sex=[[dic objectForKey:@"result"] objectForKey:@"sex"];
               if ([weeksafa.user.sex isEqualToString:@"1"]) {
                   weeksafa.user.sex=@"女";
               }else{
                   weeksafa.user.sex=@"男";
               }
                weeksafa.user.truename=[[dic objectForKey:@"result"] objectForKey:@"reaname"];
              weeksafa.user.money=[[dic objectForKey:@"result"] objectForKey:@"count_money"];
               
               NSLog(@">>>>>weeksafa.user.tokenself.token>>>>>>>：%@", weeksafa.user.token);
               NSLog(@">>>>>weeksafa.user.userid>>>>>>>:%@",weeksafa.user.userid);
               
               
               weeksafa.user.isLoad=YES;
             //[[NSNotificationCenter defaultCenter ]postNotificationName:@"login" object:weeksafa  userInfo:nil];
               
               [weeksafa dismissViewControllerAnimated:YES completion:nil];
           }else{
               [weeksafa getalert:[dic objectForKey:@"error"]];
           }
       });
       
   } WithFailBlock:^(NSError *error) {
       
   }];
}
-(void)registerclick:(UIButton *)sender{
    NSLog(@"快速注册");
    
    [self dismissViewControllerAnimated:NO completion:nil];
    
    UIWindow * window=[UIApplication sharedApplication].keyWindow;
   
    RegisterViewController * reg=[[RegisterViewController alloc]init];
  //[self presentViewController:reg animated:YES completion:nil];
    [window.rootViewController presentViewController:reg animated:YES completion:nil];
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [self.view endEditing:YES];
    
}
#pragma mark 提示框
-(void)getalert:(NSString *)string{
    UIAlertView * alert=[[UIAlertView alloc]initWithTitle:@"温馨提示" message:string delegate:nil cancelButtonTitle:nil otherButtonTitles:@"知道了", nil];
    [alert show];
}
#pragma makr UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
   
    if (alertView.tag!=2010) {
        if (buttonIndex==0) {
            self.user.isLoad=NO;
            nametext.text=@"";
            pwdtext.text=@"";
            self.user.token=nil;
        }else{
            self.user.isLoad=YES;
            [self dismissViewControllerAnimated:YES completion:nil];
        }
    }else{
        if (buttonIndex==0) {
            
        }else{
            NSURL * url=[NSURL URLWithString:@"http://www.baidu.com"];
            [[UIApplication sharedApplication]openURL:url];
        }
    }
}
#pragma mark 加密字符串
- (NSString *)md5:(NSString *)str
{
    const char *cStr = [str UTF8String];
    unsigned char result[16];
    CC_MD5(cStr,strlen(cStr), result); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}
#pragma mark  编辑开始和结束掉用的方法
- (void)textFieldDidEndEditing:(UITextField *)textField{
    NSLog(@"编辑结束");
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
