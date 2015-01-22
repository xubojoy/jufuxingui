//
//  HAN_FeedBackViewController.m
//  JuFuXinGui
//
//  Created by mac on 14/12/26.
//  Copyright (c) 2014年 XB. All rights reserved.
//

#import "HAN_FeedBackViewController.h"
#import "HAN_Constants.h"
#import "HAN_HttpRequest.h"
@interface HAN_FeedBackViewController ()
{
    NSDictionary * rerrdic;
}
@end

@implementation HAN_FeedBackViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[NTViewController sharedController] hidesTabBar:YES animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    rerrdic=[[NSDictionary alloc]initWithObjectsAndKeys:@"成功",@"01",@"失败",@"02",@"token不正确",@"03", nil];
    self.user=[UserModel shareuser];
    [self setRightSwipeGesture];
    [self initHeader];
    [self initBodyView];
    self.view.backgroundColor=HAN_FeedBackViewController_viewbackgroundColor;
    // Do any additional setup after loading the view from its nib.
}
- (void)initHeader{
    //初始化布局与背景
    if ([self.titleString isEqualToString:@""]||self.titleString==nil) {
        self.titleString=@"关于我们";
    }
    
    
    self.header  = [[HeaderView alloc] initWithTitle:self.titleString navigationController:self.navigationController];
    [self.view addSubview:self.header];
    [self initsendBtn];
}
-(void)initsendBtn{
    
    UIButton *shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    shareBtn.frame = commonFrame;
    shareBtn.backgroundColor = [UIColor clearColor];
    [shareBtn addTarget:self action:@selector(sendBtnPress:) forControlEvents:UIControlEventTouchUpInside];
    [shareBtn setTintColor:[UIColor whiteColor]];
    [shareBtn setTitle:@"发送" forState:UIControlStateNormal];
    [self.header addSubview:shareBtn];
}

-(void)initBodyView{
    UITextView * textfield=[[UITextView alloc]initWithFrame:CGRectMake(0, self.header.frame.size.height, HAN_FeedBackViewController_textview_width, HAN_FeedBackViewController_textview_heigh)];
    textfield.backgroundColor=[UIColor whiteColor];
    self.feedtext=textfield;
    textfield.delegate=self;
    //textfield.borderStyle=UITextBorderStyleNone;
    //textfield.placeholder=@"給我们提点意见吧？";
    UILabel* textViewLabel=[[UILabel alloc]initWithFrame:CGRectMake(15,0,HAN_FeedBackViewController_textview_width,HAN_FeedBackViewController_textViewLabel_width)];
    textViewLabel.text=@"給我们提点意见吧？";
    self.grlabel=textViewLabel;
    textViewLabel.font=[UIFont systemFontOfSize:HAN_FeedBackViewController_textview_font];
    textViewLabel.enabled=NO;
    textViewLabel.textColor=[UIColor grayColor];
    [textfield addSubview:textViewLabel];
    [self.view addSubview:textfield];
    UIToolbar *  toolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, HAN_FeedBackViewController_textview_width,[UIScreen mainScreen].bounds.size.height/15)];
    toolbar.backgroundColor = [UIColor lightGrayColor];
  UIBarButtonItem *  donebtn = [[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(doneAction)];
    UIBarButtonItem * btnSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    NSArray * buttonsArray = [NSArray arrayWithObjects:btnSpace, donebtn, nil];
    [toolbar setItems:buttonsArray];
    textfield.inputAccessoryView = toolbar;
}
#pragma mark UITextViewDelegate

- (void)textViewDidBeginEditing:(UITextView *)textView{
    self.grlabel.hidden=YES;
}
- (void)textViewDidEndEditing:(UITextView *)textView{
    
    if ([textView.text isEqualToString:@""]) {
        self.grlabel.hidden=NO;
    }else{
        
    }
   
}


-(void)doneAction{
    [self.view endEditing:YES];
}
#pragma mark 发送按钮
-(void)sendBtnPress:(UIButton *)sender{
    NSLog(@"发送按钮");
    sender.userInteractionEnabled=NO;
    if (self.user.token!=nil) {
        __weak HAN_FeedBackViewController * weeksafa=self;
        if (![self.feedtext.text isEqualToString:@""]) {
            HAN_HttpRequest * han=[HAN_HttpRequest defaultRequest];
            NSDictionary * dic=[[NSDictionary alloc]initWithObjectsAndKeys:self.feedtext.text,@"content",@"2",@"class",self.user.token,@"token", nil];
            [han getfeedbackWithNSDictionary:dic
                            andSuccessBlock:^(id data) {
                                sender.userInteractionEnabled=YES;
                NSDictionary * dic=(NSDictionary *)data;
                
                                [weeksafa getalert:[rerrdic objectForKey:[dic objectForKey:@"code"]]];
                                
            } WithFailBlock:^(NSError *error) {
                sender.userInteractionEnabled=YES;
            }];
        }else{
            [self getalert:@"意见不能为空"];
            sender.userInteractionEnabled=YES;
        }
    }else{
        [self getalert:@"登录后才能操作"];
        sender.userInteractionEnabled=YES;
    }
    
}
-(void)getalert:(NSString *)title {
    UIAlertView * alert=[[UIAlertView alloc]initWithTitle:@"温馨提示" message:title delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles:nil, nil];
    [alert show];
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
