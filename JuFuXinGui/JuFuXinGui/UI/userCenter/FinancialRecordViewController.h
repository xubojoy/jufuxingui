//
//  FinancialRecordViewController.h
//  JuFuXinGui
//
//  Created by mac on 14/12/30.
//  Copyright (c) 2014年 XB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserModel.h"
@interface FinancialRecordViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
@property(nonatomic,strong)UITableView * tableview;
@property(nonatomic,strong)UITextField * cashfield;
@property(nonatomic,strong)UITextField * rcachfield;
@property (nonatomic, strong) HeaderView *header;
@property (nonatomic,strong)UserModel * user;
@end
