//
//  MyDatumViewController.m
//  JuFuXinGui
//
//  Created by mac on 14/12/29.
//  Copyright (c) 2014年 XB. All rights reserved.
//

#import "MyDatumViewController.h"
#import "HAN_Constants.h"
#import "HAN_HttpRequest.h"
#import "AboutUsCell.h"
#import "UserModel.h"
#import "PopoverView.h"
#import "HeadImageViewController.h"
#import "MyAlert.h"
static NSString *cellIdentifier = @"ccelll";
@interface MyDatumViewController ()
{
    NSArray * titlearray;
    UIToolbar * toolbar;
    UIImageView * seximage1;
    UIImageView * seximage2;
}
@end

@implementation MyDatumViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    toolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, Screen_weight, Screen_height/15)];
    toolbar.backgroundColor = [UIColor lightGrayColor];
    UIBarButtonItem*  doneBtn = [[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(doneAction)];
    UIBarButtonItem * btnSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    NSArray * buttonsArray = [NSArray arrayWithObjects:btnSpace, doneBtn, nil];
    [toolbar setItems:buttonsArray];
    
    self.user=[UserModel shareuser];
    titlearray=@[@"姓名",@"性别"];
    [self setRightSwipeGesture];
    [self initHeader];
    [self initsendBtn];
    [self initbodyview];
    // Do any additional setup after loading the view from its nib.
}
-(void)initbodyview{
    UITableView * tableview=[[UITableView alloc]initWithFrame:CGRectMake(0,self.header.frame.size.height+10, screen_width,120)];
    tableview.delegate=self;
    tableview.dataSource=self;
    self.tableview=tableview;
    UINib *nib = [UINib nibWithNibName:@"AboutUsCell" bundle:nil];
   
    [tableview registerNib:nib forCellReuseIdentifier:cellIdentifier];
    tableview.scrollEnabled=NO;
    [self.view addSubview:tableview];
    
}
#pragma mark UITableViewDataSource @required

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AboutUsCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    UILabel * label=[[UILabel alloc]initWithFrame:CGRectMake(100,0,130,40)];
    UIImageView * iamgeview=[[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 40, 40)];
    //[cell addSubview:iamgeview];
    if (indexPath.section==0) {
        UITextField * textfield=[[UITextField alloc]initWithFrame:CGRectMake(Screen_weight-100,0,100,40)];
        textfield.borderStyle=UITextBorderStyleNone;
        self.nametext=textfield;
        textfield.textColor=[UIColor lightGrayColor];
        textfield.inputAccessoryView=toolbar;
        textfield.text=self.user.truename;
        iamgeview.image=[UIImage imageNamed:@"软件介绍"];
        [cell addSubview:textfield];
    }
    else if(indexPath.section==1){
        UITextField * textfield=[[UITextField alloc]initWithFrame:CGRectMake(Screen_weight-100,0,100,40)];
        self.sextext=textfield;
        textfield.textColor=[UIColor lightGrayColor];
        self.sextext.text=self.user.sex;
        self.sextext.userInteractionEnabled=NO;
        textfield.inputAccessoryView=toolbar;
        textfield.borderStyle=UITextBorderStyleNone;
        [cell addSubview:textfield];
        iamgeview.image=[UIImage imageNamed:@"常见问题"];
    }
    label.textAlignment=NSTextAlignmentRight;
    label.text=@"";
   if (indexPath.section==1) {
           cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        label.text=[titlearray objectAtIndex:indexPath.section];
        
        
    }else if(indexPath.section==0){
        label.text=[titlearray objectAtIndex:indexPath.section];
    }
    if (indexPath.section<=1) {
       cell.textLabel.text=[titlearray objectAtIndex:indexPath.section];
    }
    else{
        //cell.textLabel.text=@"上传新头像";
    }
    
    return cell;
    
}
#pragma mark 完善资料点击表格。

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section==1) {
        NSLog(@"");
        [self getmyalert];
    }
    
}
-(void)getmyalert{
    
    MyAlert * alert=[[MyAlert alloc]initMyAlertWithTitle:@"温馨提示" delegate:self cancelButtonTitle:@"取消" otherButtonTitle:@"确定"];
    alert.missTime=50;
    [alert show];
    UIButton * button=[UIButton buttonWithType:UIButtonTypeCustom];
    button.frame=CGRectMake(20,40,40,40);
    [button setTitle:@"男" forState:UIControlStateNormal];
    button.titleLabel.font=[UIFont systemFontOfSize:20];
    UIImageView  * iamgeview=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"没选"] highlightedImage:[UIImage imageNamed:@"选择"]];
    
    iamgeview.frame=CGRectMake(button.frame.size.width+20,button.frame.origin.y+10,20,20);
    [alert addSubview:iamgeview];
    seximage1=iamgeview;
    
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(clickbtn:) forControlEvents:UIControlEventTouchUpInside];
    
    button.tag=100110;
    UIButton * button1=[UIButton buttonWithType:UIButtonTypeCustom];
    
    
   
    [button1 setTitle:@"女" forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button1.titleLabel.font=[UIFont systemFontOfSize:20];
    button1.frame=CGRectMake(20+(Screen_weight-40)/2,40,40,40);
    button1.tag=100120;
    [button1 addTarget:self action:@selector(clickbtn:) forControlEvents:UIControlEventTouchUpInside];
   
    UIImageView  * iamgeview1=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"没选"] highlightedImage:[UIImage imageNamed:@"选择"]];
    iamgeview1.frame=CGRectMake(button1.frame.size.width+button1.frame.origin.x,button1.frame.origin.y+10,20,20);
    [alert addSubview:iamgeview1];
    seximage2=iamgeview1;
    [alert addSubview:button];
    [alert addSubview:button1];
    if ([self.sextext.text isEqualToString:@"女"]) {
        iamgeview1.highlighted=YES;
    }else{
        
         iamgeview.highlighted=YES;
    }
   
}
-(void)clickbtn:(UIButton *)sender{
    sender.selected=!sender.selected;
    
    if (sender.tag==100110) {
        seximage1.highlighted=YES;
        seximage2.highlighted=NO;
    }else{
        seximage2.highlighted=YES;
        seximage1.highlighted=NO;
    }
   
    
}
-(void)doSomethingWith:(MyAlert *)alert btn:(UIButton *)sender{
    NSLog(@"点的事%ld",(long)sender.tag);
    if (sender.tag==3040) {
        if (seximage1.highlighted==YES) {
            self.sextext.text=@"男";
        }else{
            self.sextext.text=@"女";
        }
        
    }else{
        
        
    }
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[NTViewController sharedController] hidesTabBar:YES animated:YES];
}

//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (indexPath.section==2) {
//        HeadImageViewController  * vc=[[HeadImageViewController alloc]init];
//        [self.navigationController pushViewController:vc
//                    animated:YES];
//    }
//}
#pragma mark 结束编辑后
-(void)doneAction{
    [self.view endEditing:YES];
    if ([self.nametext.text isEqualToString:@""]) {
        
    }else{
        self.textbtn.selected=YES;
        [self.textbtn setTitle:@"上传" forState:UIControlStateNormal];
    }
    
    
    
}
#pragma mark - 头部相关
//初始化头部
- (void)initHeader{
    //初始化布局与背景
    self.header  = [[HeaderView alloc] initWithTitle:@"完善资料" navigationController:self.navigationController];
    self.header.backBut.hidden = NO;
    
    
    [self.view addSubview:self.header];
}
-(void)initsendBtn{
    
    UIButton *shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    shareBtn.frame = commonFrame;
    shareBtn.backgroundColor = [UIColor clearColor];
    [shareBtn addTarget:self action:@selector(sendBtnPress:) forControlEvents:UIControlEventTouchUpInside];
    [shareBtn setTintColor:[UIColor whiteColor]];
    [shareBtn setTitle:@"编辑" forState:UIControlStateNormal];
    //[shareBtn setTitle:@"完成" forState:UIControlStateSelected];
    self.textbtn=shareBtn;
    [self.header addSubview:shareBtn];
}
-(void)sendBtnPress:(UIButton *)sender{
    
    if (sender.selected==NO) {
        
        [self.nametext becomeFirstResponder];
    }else{
        
        [self getalert];
    }
    
    
}
-(void)getalert{
    NSString * string=@"";
    if ([self.nametext.text isEqualToString:@""]||[self.sextext.text isEqualToString:@""]) {
        string=@"信息请填写完整";
    }else{
        
        if([self.sextext.text isEqualToString:@"男"]||[self.sextext.text isEqualToString:@"女"]){
            string=[NSString stringWithFormat:@"提交信息为\n姓名：%@ 性别：%@",self.nametext.text,self.sextext.text];
            }
        else{
            string=@"请填写正确的性别";
        }
    
    }
    UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"温馨提示" message:string delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alert show];
}

#pragma mark 提示框
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
   
}
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex{
    self.textbtn.selected=NO;
    
    [self.textbtn setTitle:@"编辑" forState:UIControlStateNormal];
    
    if (buttonIndex==0) {
        //取消
        
        
    }else{
        //确定
        [self shangchuan];
    }
}
-(void)shangchuan{
    NSLog(@"我们是什么");
    __weak MyDatumViewController * safaweek=self;
    NSString * sex=@"";
    if ([self.sextext.text isEqualToString:@"女"]) {
        sex=@"1";
    }else{
        sex=@"2";
    }
    NSDictionary * postdic=[[NSDictionary alloc]
                            initWithObjectsAndKeys:self.user.token,@"token",self.nametext.text,@"realname",sex,@"sex",nil];
    HAN_HttpRequest * request=[HAN_HttpRequest defaultRequest];
    [request PersonalDataWithNSDictionary:postdic andSuccessBlock:^(id data) {
        NSDictionary * dic=(NSDictionary *)data;
        NSLog(@"%@",dic);
        if ([[dic objectForKey:@"code"] isEqualToString:@"01"]) {
            
            safaweek.user.sex=safaweek.sextext.text;
            safaweek.user.truename=safaweek.nametext.text;
            [[[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"修改成功" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil] show];
            [safaweek.tableview reloadData];
            
        }else if([[dic objectForKey:@"code"] isEqualToString:@"03"]){
            [[[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"修改失败" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil] show];
        }
        
    } WithFailBlock:^(NSError *error) {
        
    }];
    
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
