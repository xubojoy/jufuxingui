//
//  ChangJianViewController.h
//  JuFuXinGui
//
//  Created by mac on 15/1/5.
//  Copyright (c) 2015年 XB. All rights reserved.
//

#import "WebViewController.h"
#import "LocalCache.h"
@interface ChangJianViewController : UIViewController
@property (nonatomic,strong)HeaderView * header;
@property (nonatomic,strong)NSString * context;
@property (nonatomic,strong)NSString  *titleString;
@property (nonatomic,strong)LocalCache *local;
@end
