//
//  SearchViewController.m
//  IMFiveApp
//
//  Created by 王圆圆 on 14-11-5.
//  Copyright (c) 2014年 chen. All rights reserved.
//

#import "SearchViewController.h"
#import "ChineseInclude.h"
#import "PinYinForObjc.h"
#import "Macro.h"
#import "InvestmentCell.h"
#import "RecommendViewController.h"

@interface SearchViewController ()

@end

@implementation SearchViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    [[NTViewController sharedController] hidesTabBar:YES animated:YES];
    self.searchResults = [NSMutableArray new];
    self.currentPageNo = 0;
    [self setRightSwipeGesture];
    [self initHeader];
    [self initSearchView];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
}
#pragma mark - 头部相关
//初始化头部
- (void)initHeader{
    //初始化布局与背景
    self.header  = [[HeaderView alloc] initWithTitle:@"搜索" navigationController:self.navigationController];
    [self.view addSubview:self.header];
}


-(void)initSearchView{
    mySearchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, self.header.frame.size.height, screen_width, 40)];
    mySearchBar.delegate = self;
    [mySearchBar setPlaceholder:@"请输入关键字"];
    
    searchDisplayController = [[UISearchDisplayController alloc]initWithSearchBar:mySearchBar contentsController:self];
    searchDisplayController.active = NO;
    [self initTableView];
    [self.view addSubview:mySearchBar];
}

/**
 *  数据的懒加载
 */
- (NSMutableArray *)searchResults
{
    if (!_searchResults) {
        self.searchResults = [NSMutableArray array];
    }
    return _searchResults;
}

#pragma mark - UISearchBarDelegate
-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
    
    searchBar.showsCancelButton = YES;
    for(id cc in [searchBar subviews])
    {
        if([cc isKindOfClass:[UIButton class]])
        {
            UIButton *btn = (UIButton *)cc;
            [btn setTitle:@"取消"  forState:UIControlStateNormal];
        }
    }
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    NSLog(@">>>>>>>>>>>>>>点击搜索按钮");
    self.searchStr = searchBar.text;
    [self loadSearchData:searchBar.text];
}

#pragma mark - 加载搜索数据
-(void)loadSearchData:(NSString *)searchText{
//    [MBHUDView hudWithBody:@"正在加载..." type:MBAlertViewHUDTypeActivityIndicator hidesAfter:30 show:YES];
    [self.searchResults removeAllObjects];
    NSString *url = URL_Search(searchText, self.currentPageNo, 10);
    JSHttpRequest *request = [[JSHttpRequest alloc] init];
    [request StartWorkWithUrlstr:url];
    request.successGetData = ^(id obj){
//        [MBHUDView dismissCurrentHUD];
        NSString *code = [obj valueForKey:@"code"];
        int page = [[obj valueForKey:@"page"] intValue];
        NSLog(@">>>>>>objobjobjobjobj>>>>>>>%@",obj);
        if ([code isEqualToString:@"01"]) {
            [self.searchResults addObjectsFromArray:[obj valueForKey:@"result"]];
            [self initTableView];
            [self setupRefresh];
            [self.tableView reloadData];
            if (self.currentPageNo<page) {
                self.currentPageNo ++;
            }
            else{
                [self.tableView removeFooter];
                UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screen_width, 40)];
                UILabel *footerLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, screen_width, 40)];
                footerLab.text = @"没有更多了";
                footerLab.font = [UIFont systemFontOfSize:13];
                footerLab.textAlignment = NSTextAlignmentCenter;
                footerLab.textColor = [UIColor lightGrayColor];
                [footerView addSubview:footerLab];
                self.tableView.tableFooterView = footerView;
            }
        }
    };
    [self.tableView reloadData];
}

#pragma mark - 初始化TableView
-(void)initTableView{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,self.header.frame.size.height+40,screen_width , VIEW_HEIGHT-self.header.frame.size.height-40) style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
}


#pragma UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"______self.searchResults.count________1111111111________%ld",self.searchResults.count);
    return self.searchResults.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"cell";
    InvestmentCell *cell = [[InvestmentCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        
    [cell renderInvestMentWithDict:[self.searchResults objectAtIndex:indexPath.row]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSString *productId = [[self.searchResults objectAtIndex:indexPath.row] valueForKey:@"id"];
    NSString *allmoney = [[self.searchResults objectAtIndex:indexPath.row] valueForKey:@"allmoney"];
    NSString *interestrates = [[self.searchResults objectAtIndex:indexPath.row] valueForKey:@"interestrates"];
    RecommendViewController * rvc = [[RecommendViewController alloc]initWithProductId:productId investMenoy:allmoney interestrates:interestrates];
    [self.navigationController pushViewController:rvc animated:YES];

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

#pragma mark - 初始化刷新控件
/**
*  集成刷新控件
*/
- (void)setupRefresh
{
    // 1.下拉刷新(进入刷新状态就会调用self的headerRereshing)
    [self.tableView addHeaderWithTarget:self action:@selector(headerRereshing)];
    
    // 2.上拉加载更多(进入刷新状态就会调用self的footerRereshing)
    [self.tableView addFooterWithTarget:self action:@selector(footerRereshing)];
    
    // 设置文字(也可以不设置,默认的文字在MJRefreshConst中修改)
    self.tableView.headerPullToRefreshText = @"下拉可以刷新了";
    self.tableView.headerReleaseToRefreshText = @"松开马上刷新了";
    self.tableView.headerRefreshingText = @"正在刷新,请稍等...";
    
    self.tableView.footerPullToRefreshText = @"上拉可以加载更多数据了";
    self.tableView.footerReleaseToRefreshText = @"松开马上加载更多数据了";
    self.tableView.footerRefreshingText = @"正在刷新,请稍等...";
}

- (void)headerRereshing
{
    // 2.2秒后刷新表格UI
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self loadSearchData:self.searchStr];
        [self.tableView headerEndRefreshing];
    });
    
}

- (void)footerRereshing
{
    // 2.2秒后刷新表格UI
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self loadSearchData:self.searchStr];
        // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
        [self.tableView footerEndRefreshing];
    });
}

@end
