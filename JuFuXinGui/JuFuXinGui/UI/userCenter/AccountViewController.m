//
//  AccountViewController.m
//  JuFuXinGui
//
//  Created by mac on 14/12/29.
//  Copyright (c) 2014年 XB. All rights reserved.
//

#import "AccountViewController.h"
#import "HAN_Constants.h"
#import "FinancialRecordViewController.h"
#import "ProjectViewController.h"
#import "RemittanceViewController.h"
#import "MyIncomeViewController.h"
#import "UIViewController+Custom.h"
@interface AccountViewController ()
{
    NSArray * titlestring;
    NSMutableArray * btnarray;
      int centery;
}
@end

@implementation AccountViewController

-(instancetype)initWithType:(int)type{
    self = [super init];
    if (self) {
        self.type = type;
    }
    return self;

}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[NTViewController sharedController] hidesTabBar:YES animated:YES];
    if (self.type == type_from_buy) {
        [self honghua:2];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
  
    if (Screen_weight==320) {
        centery=49;
        
    }else{
        centery=59;
    }
    self.viewarray=[[NSMutableArray alloc]initWithCapacity:0];
    titlestring=[NSArray arrayWithObjects:@"资金记录",@"已投项目",@"回款计划",@"我的收益", nil];
    btnarray =[[NSMutableArray alloc]initWithCapacity:0];
    [self setRightSwipeGesture];
    [self initHeader];
    [self inittitleviewview];
    [self initbodyview];
    
    // Do any additional setup after loading the view from its nib.
}

#pragma mark - 头部相关
//初始化头部
- (void)initHeader{
    //初始化布局与背景
    self.header  = [[HeaderView alloc] initWithTitle:@"账户管理" navigationController:self.navigationController];
    self.header.backBut.hidden = NO;
    [self.view addSubview:self.header];
}


-(void)inittitleviewview{
    UIView * titleview=[[UIView alloc]initWithFrame:CGRectMake(0,self.header.frame.size.height,Screen_weight, 60)];
    if (Screen_weight==320) {
        titleview.frame=CGRectMake(0,self.header.frame.size.height,Screen_weight,50);
    }
    titleview.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:titleview];
    for (int i=0; i<4; i++) {
        UIButton * label=[UIButton buttonWithType:UIButtonTypeCustom];
        
        if (Screen_weight==320) {
            label.frame=CGRectMake(15+i*(Screen_weight-20)/4, 5,(Screen_weight-30)/4,50);
              label.titleLabel.font=[UIFont systemFontOfSize:15];
        }else{
            label.frame=CGRectMake(15+i*(Screen_weight-20)/4, 5,(Screen_weight-30)/4,50);
              label.titleLabel.font=[UIFont systemFontOfSize:18];
        }
      
        [label setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [label setTitle: [titlestring objectAtIndex:i] forState:UIControlStateNormal];
        [label setTitleColor:blue_color forState:UIControlStateSelected];
        
        
        if (i==0) {
            label.selected=YES;
        }else{
            UILabel * line=[[UILabel alloc]initWithFrame:CGRectMake(18+i*(Screen_weight-30)/4,18,1,25)];
            if (Screen_weight==320) {
                line.frame=CGRectMake(18+i*(Screen_weight-30)/4,21,1,20);
            }
            line.backgroundColor=[UIColor lightGrayColor];
            [titleview addSubview:line];
        }
        [label addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        [titleview addSubview:label];
        [btnarray addObject:label];
        label.tag=100+i;
    }
    
    UIButton * btn=(UIButton *)[btnarray objectAtIndex:0];
    UIImageView * maage=[[UIImageView alloc]initWithFrame:CGRectMake(40,5,(Screen_weight-80)/4+10,1)];
    maage.backgroundColor=blue_color;
    maage.center=CGPointMake(btn.center.x,centery);
    [titleview addSubview:maage];
    self.tiletiamge=maage;
    UILabel * labelline=[[UILabel alloc]initWithFrame:CGRectMake(0,centery+0.5,Screen_weight,0.5)];
    
    labelline.backgroundColor=[UIColor lightGrayColor];
    [titleview addSubview:labelline];
}
-(void)click:(UIButton *)sender{
    
    for (int i=0; i<btnarray.count; i++) {
        UIButton * btn=(UIButton *)[btnarray objectAtIndex:i];
        btn.selected=NO;
    }
    sender.selected=!sender.selected;
    [self honghua:(int)sender.tag-100];
    
}
-(void)honghua:(int )i{
    UIButton * btn=(UIButton *)[btnarray objectAtIndex:i];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDelay:0.1];
    self.myscrollview.contentOffset=CGPointMake(i*Screen_weight,0);
    self.tiletiamge.center=CGPointMake(btn.center.x,centery);
    [UIView commitAnimations];
    

}
-(void)honghuahe:(int)i{
    UIButton * btn=(UIButton *)[btnarray objectAtIndex:i];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDelay:0.1];
    self.tiletiamge.center=CGPointMake(btn.center.x,centery);
    [UIView commitAnimations];
    for (int j=0; j<btnarray.count; j++) {
        UIButton * btn=(UIButton *)[btnarray objectAtIndex:j];
        btn.selected=NO;
        if (j==i) {
            btn.selected=YES;
        }
    }
}
-(void)initbodyview{
    UIScrollView * scrollview=[[UIScrollView alloc]initWithFrame:CGRectMake(0,self.header.frame.size.height+60, Screen_weight,Screen_height-self.header.frame.size.height+60)];
    if (Screen_weight==320) {
        scrollview.frame=CGRectMake(0,self.header.frame.size.height+50, Screen_weight, Screen_height-self.header.frame.size.height+60);
    }
    scrollview.delegate=self;
    scrollview.contentSize=CGSizeMake(Screen_weight*4, Screen_height-self.header.frame.size.height+60);
    scrollview.pagingEnabled=YES;
    self.myscrollview=scrollview;
    for (int i=0; i<4; i++) {
        UIView *  view=[[UIView alloc]initWithFrame:CGRectMake(i*Screen_weight,0,Screen_weight,scrollview.frame.size.height)];
        if (i==0) {
            FinancialRecordViewController * rec=[[FinancialRecordViewController alloc]init];
            self.financialvc=rec;
           [view addSubview:rec.view];
//rec.view.frame=CGRectMake(i*Screen_weight,0,Screen_weight,scrollview.frame.size.height);
//            [scrollview addSubview:rec.view];
        }else if(i==1){
            RemittanceViewController * recv=[[RemittanceViewController alloc]init];
           //recv.view.frame=CGRectMake(i*Screen_weight,0,Screen_weight,scrollview.frame.size.height);
            self.remVC=recv;
            [view addSubview:recv.view];
        }else if(i==2){
            ProjectViewController * pvc=[[ProjectViewController alloc]init];
            self.ProVC=pvc;
            
            [view addSubview:pvc.view];
        }else if(i==3){
            MyIncomeViewController * imvc=[[MyIncomeViewController alloc]init];
            self.incomeVC=imvc;
            [view addSubview:imvc.view];
            
        }
        [self.viewarray addObject:view];
        [scrollview addSubview:view];
    }
    [self.view addSubview:scrollview];
    
}

#pragma mark UIScrollViewDelegate
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    NSLog(@"====================");
//    int x=scrollView.contentOffset.x/screen_width;
//    NSLog(@"%d",x);
    //[self honghua:x];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    NSLog(@"");
//    int x=scrollView.contentOffset.x/Screen_weight;
//    NSLog(@"%d",x);
//    [self honghua:x+1];
//    int x=scrollView.contentOffset.x/screen_width;
    
   // [self honghuahe:x+1];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
//    NSLog(@"滚动中");
    [self.view endEditing:YES];
    if (scrollView == self.myscrollview) {
        CGFloat scrollviewW = scrollView.frame.size.width;
        CGFloat x = scrollView.contentOffset.x;
        int page = (x + scrollviewW / 2) /  scrollviewW;
        bannerCont.currentPage = page;
        NSLog(@"_____________________页数是%d",page);
        [self honghuahe:page];
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