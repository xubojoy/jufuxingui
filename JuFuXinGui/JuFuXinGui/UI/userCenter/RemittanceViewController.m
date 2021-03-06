//
//  RemittanceViewController.m
//  JuFuXinGui
//
//  Created by mac on 14/12/30.
//  Copyright (c) 2014年 XB. All rights reserved.
//

#import "RemittanceViewController.h"
#import "YiTouXiangMuModel.h"
#import "HAN_HttpRequest.h"
#import "HAN_UIConstants.h"
#import "UserModel.h"
#define tilel_tag 12120
#define li_tag    12130
#define feng_tag  12140
#define qi_tag    12150
@interface RemittanceViewController ()
{
    int all;
    int addpage;
    int start;
    int pagenum;
}
@end

@implementation RemittanceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    addpage=1;
    if (Screen_weight==480) {
        pagenum=6;
    }else if(Screen_weight==568){
        pagenum=7;
    }else if(Screen_weight==667){
        pagenum=10;
    }else if(Screen_weight==736){
        pagenum=12;
    }
    self.user=[UserModel shareuser];
     self.modelarray=[[NSMutableArray alloc]initWithCapacity:0];
    
   
    self.view.frame=[UIScreen mainScreen].bounds;
    [self initview];
    [self.tableview headerBeginRefreshing];
    // Do any additional setup after loading the view from its nib.
}
-(void)initview{
    self.tableview=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, screen_width,Screen_height)];
    self.tableview.delegate=self;
    self.tableview.dataSource=self;
    self.tableview.rowHeight=100;
    self.tableview.separatorStyle=UITableViewCellSeparatorStyleNone;
    self.tableview.tableFooterView=[self tableviewheader];
    [self.tableview addHeaderWithTarget:self action:@selector(headerRereshing)];
      [self.tableview addFooterWithTarget:self action:@selector(footerRereshing)];
    [self.view addSubview:self.tableview];
}
-(void)footerRereshing{
    if (self.modelarray.count>=all) {
        self.morelabel.text=@"没有加载更多了";
    }else{
        addpage=addpage+pagenum;
        [self getdata:addpage];
    }
    
}
-(UIView *)tableviewheader{
    UIView * view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, Screen_weight, 50)];
     view.backgroundColor=[UIColor whiteColor];
    self.morelabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, Screen_weight, 50)];
    self.morelabel.textColor=RGBACOLOR(219, 219, 219,1);
    self.morelabel.text=@"加载更多";
    self.morelabel.textAlignment=NSTextAlignmentCenter;
    [view addSubview:self.morelabel];
    return view;
}
-(void)headerRereshing{
    addpage=0;
    [self.modelarray removeAllObjects];
    [self getdata:addpage];
}


#pragma mark UITableViewDataSource @required


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.modelarray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"celllll";
    UITableViewCell * cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        UILabel * timelabel=[[UILabel alloc]initWithFrame:CGRectMake(10,0,80,40)];
        timelabel.tag=tilel_tag;
        [cell addSubview:timelabel];
        /*
         @"预期年化收益率";
         */
        UILabel * label1=[[UILabel alloc]initWithFrame:CGRectMake(10, timelabel.frame.size.height,screen_width/3, 30)];
        label1.textColor=[UIColor lightGrayColor];
        label1.textAlignment=NSTextAlignmentLeft;
        label1.text=@"预期年化收益率";
        label1.font=[UIFont systemFontOfSize:13];
        [cell addSubview:label1];
        UILabel * label11=[[UILabel alloc]initWithFrame:CGRectMake(10, label1.frame.size.height+label1.frame.origin.y,screen_width/3,30)];
        label11.textColor=[UIColor redColor];
        label11.textAlignment=NSTextAlignmentLeft;
        label11.tag=li_tag;
        label11.font=[UIFont systemFontOfSize:13];
        [cell addSubview:label11];
        /*
         @"封闭期"
         */
        UILabel * label2=[[UILabel alloc]initWithFrame:CGRectMake(10+screen_width/3, timelabel.frame.size.height,screen_width/3, 30)];
        label2.textColor=[UIColor lightGrayColor];
        label2.textAlignment=NSTextAlignmentCenter;
        label2.text=@"封闭期";
        label2.font=[UIFont systemFontOfSize:13];
        [cell addSubview:label2];
        UILabel * label21=[[UILabel alloc]initWithFrame:CGRectMake(10+screen_width/3, label2.frame.size.height+label2.frame.origin.y,screen_width/3,30)];
        label21.textColor=[UIColor redColor];
        label21.textAlignment=NSTextAlignmentCenter;
        label21.tag=feng_tag;
        label21.font=[UIFont systemFontOfSize:13];
        [cell addSubview:label21];
        /*
         @"起投金额"
         */
        UILabel * label3=[[UILabel alloc]initWithFrame:CGRectMake(10+(screen_width/3)*2, timelabel.frame.size.height,screen_width/3, 30)];
        label3.textColor=[UIColor lightGrayColor];
        label3.textAlignment=NSTextAlignmentCenter;
        label3.text=@"起投金额";
        label3.font=[UIFont systemFontOfSize:13];
        [cell addSubview:label3];
        
        UILabel * label31=[[UILabel alloc]initWithFrame:CGRectMake(10+(screen_width/3)*2, label3.frame.size.height+label3.frame.origin.y,screen_width/3,30)];
        label31.textColor=[UIColor redColor];
        label31.textAlignment=NSTextAlignmentCenter;
        label31.tag=qi_tag;
        label31.font=[UIFont systemFontOfSize:13];
        [cell addSubview:label31];
        UILabel * linelabel=[[UILabel alloc]initWithFrame:CGRectMake(0,99, screen_width, 1)];
        linelabel.backgroundColor=[UIColor lightGrayColor];
        linelabel.alpha=0.8;
        [cell addSubview:linelabel];
        
        
    }
    UILabel * label=(UILabel *)[cell viewWithTag:tilel_tag];
    
    UILabel * label1=(UILabel *)[cell viewWithTag:li_tag];
    UILabel * label2=(UILabel *)[cell viewWithTag:feng_tag];
    UILabel * label3=(UILabel *)[cell viewWithTag:qi_tag];
    label.text=@"";
    label1.text=@"";label2.text=@"";label3.text=@"";
    YiTouXiangMuModel * model=[self.modelarray objectAtIndex:indexPath.row];
    label.text=[NSString stringWithFormat:@"%@个月",model.month];
    label1.text=[NSString stringWithFormat:@"%@％",model.interestrates];
    label2.text=[NSString stringWithFormat:@"%@个月",model.timelong];
    label3.text=[NSString stringWithFormat:@"%@元",model.minmoney];
    return cell;
}
-(void)getdata:(int)page {
    HAN_HttpRequest  * request=[HAN_HttpRequest defaultRequest];
    __weak RemittanceViewController * weeksafa=self;
    [request getDataWithpage:page endpage:pagenum token:self.user.token SuccessBlock:^(id data) {
        
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            dispatch_async(dispatch_get_main_queue(), ^{
                
                NSDictionary * dic=(NSDictionary *)data;
                [weeksafa chulidata:dic];
                [weeksafa.tableview footerEndRefreshing];
                [weeksafa.tableview headerEndRefreshing];
            });
        });
       
        
    } WithFailBlock:^(NSError *error) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            dispatch_async(dispatch_get_main_queue(), ^{
                [weeksafa.tableview footerEndRefreshing];
                [weeksafa.tableview headerEndRefreshing];
            });
        });
        
    }];
    
    
}

#pragma mark 处理数据

-(void)chulidata:(NSDictionary *)dic {
    if ([[dic objectForKey:@"code"] isEqualToString:@"01"]) {
        
        all=[[dic objectForKey:@"allcount"] intValue];
        NSArray * dicc=[dic objectForKey:@"result"];
        
        for (int i=0; i<dicc.count; i++) {
            
            YiTouXiangMuModel * model=[[YiTouXiangMuModel alloc]init];
            model.month=[NSString stringWithFormat:@"%@",[[dicc objectAtIndex:i] objectForKey:@"month"]];
            model.minmoney=[[dicc objectAtIndex:i] objectForKey:@"minmoney"];
            model.timelong=[[dicc objectAtIndex:i] objectForKey:@"timelong"];
            model.interestrates=[[dicc objectAtIndex:i] objectForKey:@"interestrates"];
            [self.modelarray addObject:model];
        }
        
        
        
        if (self.modelarray.count==all) {
            self.morelabel.text=@"没有更多数据了";
        }
        [self.tableview reloadData];
    }
    else if([[dic objectForKey:@"code"] isEqualToString:@"00"]){
        self.morelabel.text=@"没有数据";
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
