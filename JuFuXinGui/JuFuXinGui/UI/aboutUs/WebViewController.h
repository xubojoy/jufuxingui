//
//  WebViewController.h
//  JuFuXinGui
//
//  Created by myStyle on 14-12-25.
//  Copyright (c) 2014年 XB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LocalCache.h"
#import "HAN_Constants.h"
#import "HeaderView.h"
#import "Macro.h"
#import "NTViewController.h"
#import "MBHUDView.h"
@interface WebViewController : UIViewController
@property (nonatomic, strong) HeaderView *header;
@property (nonatomic,strong)NSString * titleString;
@property (nonatomic,strong)NSString * context;
@property (nonatomic,strong)LocalCache * local;
-(void)getadata;
-(void)initbody;
@end