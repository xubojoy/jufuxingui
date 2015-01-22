//
//  TiXianViewController.m
//  JuFuXinGui
//
//  Created by mac on 15/1/5.
//  Copyright (c) 2015年 XB. All rights reserved.
//

#import "TiXianViewController.h"

@interface TiXianViewController ()
{
    NSArray * celltitle;
    NSArray * dateltitle;
}
@end

@implementation TiXianViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    celltitle=@[@"支付宝支付",@"微信支付"];
    dateltitle=@[@"建议使用客户端",@"推荐已安装微信的用户使用"];
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
    self.header.backBut.hidden = YES;
    [self.view addSubview:self.header];
    [self addback];
    
}
-(void)addback{
    UIButton * btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame=CGRectMake(10,24,20,20);
    [btn setBackgroundImage:[UIImage imageNamed:@"top_return"] forState:UIControlStateNormal];
    
    [btn addTarget:self action:@selector(popToFrontViewController:) forControlEvents:UIControlEventTouchUpInside];
    [self.header addSubview:btn];
    
}
-(void)initbody{
    UILabel * label=[[UILabel alloc]initWithFrame:CGRectMake(20, self.header.frame.size.height, screen_width-40, 40)];
    label.backgroundColor=[UIColor clearColor];
    label.text=@"支付方式";
    [self.view addSubview:label];
    self.tableview=[[UITableView alloc]initWithFrame:CGRectMake(0, self.header.frame.size.height, screen_width, 120) style:UITableViewStyleGrouped];
    self.tableview.delegate=self;
    self.tableview.dataSource=self;
    self.tableview.scrollEnabled=NO;
    [self.view addSubview:self.tableview];
}

#pragma mark UITableViewDataSource @required


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
static NSString * Identifier=@"cell";
    UITableViewCell * cell=[tableView dequeueReusableCellWithIdentifier:Identifier];
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:Identifier];
        UIButton * btn=[UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame=CGRectMake(screen_width-60,4,40,40);
        //btn.backgroundColor=[UIColor redColor];
        [btn setBackgroundImage:[UIImage imageNamed:@"没选"] forState:UIControlStateNormal];
        btn.tag=indexPath.row;
        [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        [cell addSubview:btn];
    }
    cell.textLabel.text=[celltitle objectAtIndex:indexPath.row];
    cell.detailTextLabel.text=[dateltitle objectAtIndex:indexPath.row];
    cell.detailTextLabel.textColor=[UIColor lightGrayColor];
    if (indexPath.row==0) {
          cell.imageView.image=[UIImage imageNamed:@"支付宝"];
    }else{
         cell.imageView.image=[UIImage imageNamed:@"微信"];
    }
  
    cell.imageView.frame=CGRectMake(0,10, cell.imageView.bounds.size.width, cell.imageView.bounds.size.height);
    return cell;
}
-(void)click:(UIButton *)sender{
    
    
    
}
-(void)popToFrontViewController:(UIButton *)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
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
