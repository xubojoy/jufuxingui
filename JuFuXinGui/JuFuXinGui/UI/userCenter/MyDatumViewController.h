//
//  MyDatumViewController.h
//  JuFuXinGui
//
//  Created by mac on 14/12/29.
//  Copyright (c) 2014年 XB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserModel.h"
#import "HeaderView.h"
#import "NTViewController.h"
#import "Macro.h"
#import "MyAlert.h"
@interface MyDatumViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate,MyAlertViewDelegate>
@property (nonatomic, strong) HeaderView *header;
@property (nonatomic,strong)UserModel * user;
@property (nonatomic,strong)UITextField * nametext;
@property (nonatomic,strong)UITextField * sextext;
@property (nonatomic,strong)UIButton * textbtn;
@property (nonatomic,strong)UITableView * tableview;
@end
