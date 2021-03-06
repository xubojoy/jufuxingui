//
//  SearchViewController.h
//  IMFiveApp
//
//  Created by 王圆圆 on 14-11-5.
//  Copyright (c) 2014年 chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchViewController : UIViewController<UIWebViewDelegate,UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate>
{

    NSMutableArray *dataArray;
    UISearchBar *mySearchBar;
    UISearchDisplayController *searchDisplayController;
}
@property (strong, nonatomic) UITableView *tableView;
@property (nonatomic, strong) HeaderView *header;
@property (strong, nonatomic) UIActivityIndicatorView *activityIndicator;
@property (nonatomic, assign) int currentPageNo;
@property (nonatomic, strong) NSMutableArray *searchResults;
@property (nonatomic, copy) NSString *searchStr;

@end
