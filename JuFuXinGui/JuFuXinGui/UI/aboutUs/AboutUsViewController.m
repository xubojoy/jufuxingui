//
//  AboutUsViewController.m
//  JuFuXinGui
//
//  Created by myStyle on 14-12-17.
//  Copyright (c) 2014年 XB. All rights reserved.
//

#import "AboutUsViewController.h"
#import "AboutUsCell.h"
#import "UserModel.h"
#import "WebViewController.h"
#import "ChangJianViewController.h"
#import "YongHuViewController.h"
#import "HAN_FeedBackViewController.h"
#import "LoginViewController.h"
#import "MyGestureViewController.h"
#import "HAN_HttpRequest.h"
#import "MBHUDView.h"
#define  APP_LOOKUP_URL_ID @"http://blog.csdn.net/xiaoxuan415315/article/details/9383453"
static NSString *cellIdentifier = @"cell";
@interface AboutUsViewController ()
{
    NSArray * _loadarray;
    NSArray * _unloadarray;
    
}
@end

@implementation AboutUsViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    [[NTViewController sharedController] hidesTabBar:NO animated:YES];
    if ([UIScreen mainScreen].bounds.size.height==480) {
        if (self.user.isLoad==YES) {
            self.tableView.scrollEnabled=YES;
            
        }
    }
    if (self.user.isLoad==YES) {
        [self.tableView reloadData];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.user=[UserModel shareuser];
    [self initHeader];
    [self initTableView];
    //[[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(gaibian) name:@"login" object:nil];
    //[self initBottom];
}
-(void)gaibian{
    NSLog(@"我的通知");
    if ([UIScreen mainScreen].bounds.size.height==480) {
        if (self.user.isLoad==YES) {
           [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];
            self.tableView.scrollEnabled=YES;
        }
    }
    [self.tableView reloadData];
}
#pragma mark - 头部相关
//初始化头部
- (void)initHeader{
    //初始化布局与背景
    self.header  = [[HeaderView alloc] initWithTitle:@"关于我们" navigationController:self.navigationController];
    self.header.backBut.hidden = YES;
    [self.view addSubview:self.header];
}

//初始化tableView
#pragma mark - UITableView
-(void)initTableView{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, self.header.frame.size.height,VIEW_WEIGHT,VIEW_HEIGHT-self.header.frame.size.height) style:UITableViewStylePlain];
    //self.tableView.rowHeight=60;
    if ([UIScreen mainScreen].bounds.size.height==480) {
        if (self.user.isLoad==YES) {
            self.tableView.scrollEnabled=YES;
        }
    }
    self.tableView.scrollEnabled=NO;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    UINib *nib = [UINib nibWithNibName:@"AboutUsCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:cellIdentifier];
    self.tableView.tableFooterView=[self addviewBottom];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    [self.view addSubview:self.tableView];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 6;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 1) {
        return 2;
  
    }else if(section==3){
        if (self.user.isLoad==YES) {
            return 2;
        }else{
            return 1;
        }
    }
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * Identifier=@"Identifier";
    AboutUsCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if (!cell) {
        cell=[[AboutUsCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        
        UIImageView * image=[[UIImageView alloc]initWithFrame:CGRectMake(10,7, 30, 30)];
        image.tag=1002;
        [cell addSubview:image];
        UILabel * label=[[UILabel alloc]initWithFrame:CGRectMake(image.frame.size.width+15, 5,screen_width-23, cell.frame.size.height-10)];
        label.text=@"";
        label.tag=1001;
        image.image=[UIImage imageNamed:nil];
        [cell addSubview:label];
        UIButton *hotLineBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        hotLineBtn.backgroundColor = RGBACOLOR(27, 192, 7, 1);
        hotLineBtn.frame = CGRectMake(100,2,VIEW_WEIGHT-2*100,40);
        hotLineBtn.tag=3030;
        [hotLineBtn addTarget:self action:@selector(hotLineBtnClcik:) forControlEvents:UIControlEventTouchUpInside];
        [hotLineBtn setTitle:@"呼叫客服热线" forState:UIControlStateNormal];
        CALayer *layer = hotLineBtn.layer;
        [layer setMasksToBounds:YES];
        [layer setCornerRadius:3.0];
        UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        loginBtn.backgroundColor = [UIColor whiteColor];
        loginBtn.titleLabel.textColor=[UIColor blackColor];
        loginBtn.tag=4050;
        [loginBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [loginBtn addTarget:self action:@selector(loginBtnClcik:) forControlEvents:UIControlEventTouchUpInside];
        loginBtn.frame = CGRectMake(100,0,VIEW_WEIGHT-2*100,40);
        self.logbtn=loginBtn;
        //self.logbtn=loginBtn;
        CALayer *layer1=loginBtn.layer;
        layer1 = loginBtn.layer;
        [layer1 setMasksToBounds:YES];
        [layer1 setCornerRadius:3.0];
        [cell addSubview:hotLineBtn];
        [cell addSubview:loginBtn];
        cell.upLine.hidden=NO;
        cell.lineView.hidden=NO;
        cell.upLine=[[UILabel alloc]initWithFrame:CGRectMake(0, 0.5, screen_width, 0.5)];
        cell.upLine.backgroundColor=[UIColor lightGrayColor];
        [cell addSubview:cell.upLine];
        cell.lineView=[[UIView alloc]initWithFrame:CGRectMake(0,cell.frame.size.height-0.5, screen_width, 0.5)];
        cell.lineView.backgroundColor=[UIColor lightGrayColor];
        [cell addSubview:cell.lineView];
        
    }
    UILabel * label=(UILabel *)[cell viewWithTag:1001];
    UIImageView * image=(UIImageView *)[cell viewWithTag:1002];
    UIButton * hotLineBtn=(UIButton *)[cell viewWithTag:3030];
    UIButton *loginBtn=(UIButton *)[cell viewWithTag:4050];
    hotLineBtn.hidden=YES;
    loginBtn.hidden=YES;
    cell.upLine.hidden=NO;
    cell.lineView.hidden=NO;
    cell.backgroundColor=[UIColor whiteColor];
    if (indexPath.section == 0) {
       // cell.textLabel.text = @"软件介绍";
        label.text=@"";
        label.text=@"软件介绍";
        image.image=[UIImage imageNamed:@"软件介绍.png"];
    }else if (indexPath.section == 1){
        if (indexPath.row == 0) {
            label.text=@"";
           label.text=@"用户协议";
            cell.lineView.hidden = YES;
            image.image=[UIImage imageNamed:@"用户协议"];
        }else if(indexPath.row == 1){
            label.text=@"";
            label.text=@"意见反馈";
            cell.upLine.frame = CGRectMake(10, 0, VIEW_WEIGHT, 0.5);
          image.image=[UIImage imageNamed:@"意见反馈"];
        }else if(indexPath.row == 2){
            label.text=@"";
            label.text=@"手势密码";
            image.image=[UIImage imageNamed:@"意见反馈"];
        }
    
    }else if (indexPath.section == 2){
    
        label.text=@"";
        label.text=@"常见问题";
        image.image=[UIImage imageNamed:@"常见问题"];
        
    }else if (indexPath.section == 3){
        
        if(indexPath.row == 1){
            label.text=@"";
            label.text=@"手势密码";
            image.image=[UIImage imageNamed:@"意见反馈"];
        }else if(indexPath.row==0){
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        label.text=@"";
        label.text=@"检查更新";
        image.image=[UIImage imageNamed:@"检查更新"];
        }
    }else if(indexPath.section>=4){
        if (indexPath.section==4) {

            label.text=@"";
            image.image=[UIImage imageNamed:@""];
            hotLineBtn.hidden=NO;
            cell.upLine.hidden=YES;
            cell.lineView.hidden=YES;
            cell.backgroundColor=RGBACOLOR(245, 245, 245, 1);
            cell.accessoryType=UITableViewCellAccessoryNone;
        }else{
            label.text=@"";
            image.image=[UIImage imageNamed:@""];
            if (self.user.isLoad==YES) {
                [loginBtn setTitle:@"退出" forState:UIControlStateNormal];
            }else{
                [loginBtn setTitle:@"登陆" forState:UIControlStateNormal];
            }
            

            loginBtn.hidden=NO;
            cell.upLine.hidden=YES;
            cell.lineView.hidden=YES;
            cell.backgroundColor=RGBACOLOR(245, 245, 245, 1);
            cell.accessoryType=UITableViewCellAccessoryNone;
        }

    }
        return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        if (screen_width==320) {
            return 10;
        }else{
            return 20;
        }
        
    }
    return 10;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    WebViewController *wvc = [[WebViewController alloc] init];
    switch (indexPath.section){
        case 0://软件介绍
            wvc.titleString=@"软件介绍";
            [self.navigationController pushViewController:wvc animated:YES];
            break;
         case 1://第二区
            if (indexPath.row==0) {
                //用户协议
                wvc.titleString=@"用户协议";
                YongHuViewController  *yongvc=[[YongHuViewController alloc]init];
                yongvc.titleString=@"用户协议";
               [self.navigationController pushViewController:yongvc animated:YES];
            }else if(indexPath.row==1){
                //意见反馈
                HAN_FeedBackViewController * feedvc=[[HAN_FeedBackViewController alloc]init];
                feedvc.titleString=@"意见反馈";
                [self.navigationController pushViewController:feedvc animated:YES];
            }
            break;
            case 2://常见问题
        {
            ChangJianViewController * chang=[[ChangJianViewController alloc]init];
            chang.titleString=@"常见问题";
            
            [self.navigationController pushViewController:chang animated:YES];
            }
            
            break;
            case 3://检查更新｛
        {
            
            if(indexPath.row==1){
                MyGestureViewController * mygest=[[MyGestureViewController alloc]init];
                [self.navigationController pushViewController:mygest animated:YES];
            }else{
                [self getup];
            }
          // [MBHUDView hudWithBody:@"成功" type:MBAlertViewHUDTypeDefault hidesAfter:2 show:YES];
        }
            break;
        default:
            break;
    }
    

}

//初始化bottom
#pragma mark - 热线和登陆
- (UIView *)addviewBottom{
    UIView * view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, screen_width,200)];
    view.backgroundColor=RGBACOLOR(245, 245, 245, 1);
    UIButton *hotLineBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    hotLineBtn.backgroundColor = RGBACOLOR(27, 192, 7, 1);
    hotLineBtn.frame = CGRectMake(100,10, VIEW_WEIGHT-2*100,40);
    [hotLineBtn addTarget:self action:@selector(hotLineBtnClcik:) forControlEvents:UIControlEventTouchUpInside];
    [hotLineBtn setTitle:@"呼叫客服热线" forState:UIControlStateNormal];
    CALayer *layer = hotLineBtn.layer;
    [layer setMasksToBounds:YES];
    [layer setCornerRadius:3.0];
    //[view addSubview:hotLineBtn];
    
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    loginBtn.backgroundColor = [UIColor whiteColor];
    loginBtn.titleLabel.textColor=[UIColor blackColor];
    [loginBtn setTitle:@"退出" forState:UIControlStateSelected];
    self.logbtn=loginBtn;
    [loginBtn setTitle:@"登陆" forState:UIControlStateNormal];
    [loginBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(loginBtnClcik:) forControlEvents:UIControlEventTouchUpInside];
    loginBtn.frame = CGRectMake(100,60,VIEW_WEIGHT-2*100,40);
    layer = loginBtn.layer;
    [layer setMasksToBounds:YES];
    [layer setCornerRadius:3.0];
    //[view addSubview:loginBtn];
    return view;
}

-(void)hotLineBtnClcik:(UIButton *)sender{
    NSString *hotLine = @"010-888888888";
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:hotLine delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
    [alert show];
}

-(void)loginBtnClcik:(UIButton *)sender{
    
    
    if (self.user.isLoad==YES) {
        
        UIAlertView * alert=[[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"您确定要退出吗？" delegate:self cancelButtonTitle:@"取消"  otherButtonTitles:@"退出", nil];
        alert.tag=140140;
        [alert show];
    }else{
        LoginViewController * loginvc=[[LoginViewController alloc]init];
        [self presentViewController:loginvc animated:YES completion:nil];
       
    
    }

}

#pragma mark - UIAlertViewDelegate
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (alertView.tag==140140) {
        if (buttonIndex==0) {
            
        }else{
            [self.user goout];
            if ([UIScreen mainScreen].bounds.size.height==480) {
                if (self.user.isLoad==YES) {
                    self.tableView.scrollEnabled=YES;
                }
                else{
                    //[self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];
                    [self.tableView scrollRectToVisible:CGRectMake(0, 0, 1, 1) animated:YES];
                    self.tableView.scrollEnabled=NO;
                }
            }else{
                
            }
            [self.tableView reloadData];
        }
    }
    if (buttonIndex == 0) {
        NSLog(@">>>>>>确定>>>>>>%ld",(long)buttonIndex);
        [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"tel://010-8888888"]];
    }else if (buttonIndex == 1){
        NSLog(@">>>>>>取消>>>>>>(long)%ld",(long)buttonIndex);
    }
}



#pragma mark 获取当前app版本号
-(NSString *)getAppVersion
{
    
    NSString * appstring=   [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    return appstring;
}
#pragma mark app更新接口

- (void)onCheckVersion
{
    //http://blog.csdn.net/xiaoxuan415315/article/details/9383453
    NSString *currentVersion =[self getAppVersion];
   
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSString *URL = APP_LOOKUP_URL_ID;
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
        [request setURL:[NSURL URLWithString:URL]];
        [request setHTTPMethod:@"POST"];
        NSHTTPURLResponse *urlResponse = nil;
        NSError *error = nil;
        NSData *recervedData = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&error];
        NSError *errorr;
        if (recervedData==nil) {
            dispatch_async(dispatch_get_main_queue(), ^{

                

            });
        }else{
            id object=[NSJSONSerialization JSONObjectWithData:recervedData options:NSJSONReadingAllowFragments error:&errorr];
            if ([object isKindOfClass:[NSDictionary class]]) {
                NSDictionary *dic =(NSDictionary *)object;
                NSArray *infoArray = [dic objectForKey:@"results"];
                if ([infoArray count]) {
                    NSDictionary *releaseInfo = [infoArray objectAtIndex:0];
                    NSString *lastVersion = [releaseInfo objectForKey:@"version"];
                    //[lastVersion isEqualToString:currentVersion]
                    if (![lastVersion isEqualToString:currentVersion]) {
                        dispatch_async(dispatch_get_main_queue(), ^{
                            
                        });

                    }
                    else
                    {
                        dispatch_async(dispatch_get_main_queue(), ^{
                            
                        });
                    }
                }

            }
            else if(object==nil){
                
            }
        }


    });


}
#pragma mark 检查更新alert
-(void)getup{
  MBAlertView * alert=[MBAlertView alertWithBody:@"好的" cancelTitle:@"确定" cancelBlock:
     ^{
         NSLog(@"点几了确定");
         
         
     }];
    [alert addsToWindow];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
