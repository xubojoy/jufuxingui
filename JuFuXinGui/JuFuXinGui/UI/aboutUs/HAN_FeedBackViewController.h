//
//  HAN_FeedBackViewController.h
//  JuFuXinGui
//
//  Created by mac on 14/12/26.
//  Copyright (c) 2014年 XB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserModel.h"
#import "NTViewController.h"
#import "Macro.h"
#import "HeaderView.h"
@interface HAN_FeedBackViewController : UIViewController<UITextViewDelegate>
@property (nonatomic, strong) HeaderView *header;
@property (nonatomic,strong)NSString * titleString;
@property (nonatomic,strong)UITextView * feedtext;
@property (nonatomic,strong)UILabel * grlabel;
@property (nonatomic,strong)UserModel * user;
@end
