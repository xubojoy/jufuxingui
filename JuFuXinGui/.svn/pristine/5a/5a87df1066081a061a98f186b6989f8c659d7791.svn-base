//
//  MyIncomeViewController.m
//  JuFuXinGui
//
//  Created by mac on 14/12/30.
//  Copyright (c) 2014年 XB. All rights reserved.
//

#import "MyIncomeViewController.h"
#import "HAN_HttpRequest.h"
#import "MyInComeModel.h"
#import "HAN_Constants.h"
#import "UIScrollView+MJRefresh.h"
@interface MyIncomeViewController ()
{
    int all;
    int jiapage;
    int pagenum;
    int start;
}
@end

@implementation MyIncomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (Screen_weight==480) {
        pagenum=12;
    }else if(Screen_weight==568){
        pagenum=14;
    }else if(Screen_weight==667){
        pagenum=16;
    }else if(Screen_weight==736){
        pagenum=18;
    }
    self.user=[UserModel shareuser];
    self.dataarray=[[NSMutableArray alloc]initWithCapacity:0];
    self.modelarray=[[NSMutableArray alloc]initWithCapacity:0];
    ;
   // [self gatadata:0];
    jiapage=1;
    self.view.frame=[UIScreen mainScreen].bounds;
    [self initview];
    [self.tableview headerBeginRefreshing];
    // Do any additional setup after loading the view from its nib.
}
-(void)initview{
    self.tableview=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, screen_width,Screen_height)];
    self.tableview.delegate=self;
    self.tableview.dataSource=self;
    self.tableview.tableFooterView=[self tableviewheader];
    [self.tableview addHeaderWithTarget:self action:@selector(headeraction)];
    [self.tableview addFooterWithTarget:self action:@selector(footerRereshing)];
    self.tableview.separatorStyle=UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableview];
}
#pragma mark  刷新
-(void)headeraction{
   
    self.morelabel.text=@"刷新数据";
    [self.modelarray removeAllObjects];
    [self gatadata:0];
    jiapage=0;
    [self.tableview reloadData];
    [self.tableview headerEndRefreshing];
}
#pragma mark 加载更多
-(void)footerRereshing{
    if (self.modelarray.count>=all) {
        self.morelabel.text=@"没有加载更多了";
      //[self.tableview removeFooter];
    }else{
        jiapage=jiapage+pagenum;
        [self gatadata:jiapage];
        [self.tableview reloadData];
       
    }
    //[self.tableview footerEndRefreshing];

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
        UILabel * timelabel=[[UILabel alloc]initWithFrame:CGRectMake(screen_width-150,0,140, 40)];
        timelabel.textAlignment=NSTextAlignmentRight;
        timelabel.tag=10101;
        timelabel.textColor=[UIColor redColor];
        [cell addSubview:timelabel];
        UILabel * linelabel=[[UILabel alloc]initWithFrame:CGRectMake(0, cell.frame.size.height-1, screen_width, 1)];
        linelabel.backgroundColor=[UIColor lightGrayColor];
        linelabel.alpha=0.8;
        [cell addSubview:linelabel];
       
    }
    UILabel * label=(UILabel *)[cell viewWithTag:10101];
    MyInComeModel *model=[self.modelarray objectAtIndex:indexPath.row];
    NSLog(@"数组%@",self.modelarray);
    NSLog(@"我的%@",model.earn);
    label.text=@"sss";
    label.text=[NSString stringWithFormat:@"¥%@",model.earn];
    cell.textLabel.text=model.addtime;
    return cell;
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
-(void)gatadata:(int)page{
    __weak MyIncomeViewController * weeksafa=self;
    HAN_HttpRequest * hanrequeset=[HAN_HttpRequest defaultRequest];
    [hanrequeset getincomeDataWithpage:page end:pagenum token:self.user.token SuccessBlock:^(id data) {
   dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
           dispatch_async(dispatch_get_main_queue(), ^{
               
               NSDictionary * dic=(NSDictionary *)data;
               [weeksafa inittabelview:dic];
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
-(void)inittabelview:(NSDictionary *)dic{
    
    
    if ([[dic objectForKey:@"code"] isEqualToString:@"01"]) {
        //[self.dataarray removeAllObjects];
        NSString* page=[dic objectForKey:@"allcount"];
        all=[page intValue];
        NSArray * array=[dic objectForKey:@"result"];
      //  self.dataarray=[dic objectForKey:@"result"];
        for (int i=0; i<array.count; i++) {
            MyInComeModel * model=[[MyInComeModel alloc]init];
            model.addtime=[self getTime:[[array objectAtIndex:i] objectForKey:@"addtime"]];
            model.earn=[[array objectAtIndex:i] objectForKey:@"earn"];
            model.allmoneys=[[array objectAtIndex:i] objectForKey:@"allmoneys"];
            model.modelid=[[array objectAtIndex:i] objectForKey:@"id"];
            [self.modelarray addObject:model];
           
        }
        if (self.modelarray.count==all) {
            self.morelabel.text=@"没有更多数据了";
        }else{
             self.morelabel.text=@"加载更多";
        }
        
        [self.tableview reloadData];
      
    }else if([[dic objectForKey:@"code"] isEqualToString:@"00"]){
        
        self.morelabel.text=@"没有数据";
        //[self.tableview removeFooter];
    }
    
    
    
    
    
    
}
-(NSString *)getTime:(NSString *)time
{
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[NSString stringWithFormat:@"%@",time].intValue];
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    df.dateFormat = @"MM-dd";
    NSString *dateString = [df stringFromDate:date];
    NSArray * arry=[dateString componentsSeparatedByString:@"-"];
    NSString * restring=[NSString stringWithFormat:@"%@月%@日",[arry objectAtIndex:0],[arry objectAtIndex:1]];
    return restring;
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
