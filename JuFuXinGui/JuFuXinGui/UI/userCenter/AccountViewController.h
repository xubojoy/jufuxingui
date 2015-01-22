//
//  AccountViewController.h
//  JuFuXinGui
//
//  Created by mac on 14/12/29.
//  Copyright (c) 2014年 XB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FinancialRecordViewController.h"
#import "ProjectViewController.h"
#import "RemittanceViewController.h"
#import "MyIncomeViewController.h"
#import "HeaderView.h"
#import "NTViewController.h"

typedef enum : NSUInteger {
    type_from_buy = 1,
    type_from_other = 2,
} typeFrom;

@interface AccountViewController : UIViewController<UIScrollViewDelegate>{
    UIPageControl *bannerCont;
}
@property (nonatomic, strong) HeaderView *header;
@property (nonatomic,strong)UIImageView * tiletiamge;
@property (nonatomic,strong)UIScrollView * myscrollview;
@property (nonatomic,strong)FinancialRecordViewController * financialvc;
@property (nonatomic,strong)NSMutableArray* viewarray;
@property (nonatomic,strong)ProjectViewController * ProVC;
@property (nonatomic,strong)RemittanceViewController * remVC;
@property (nonatomic,strong)MyIncomeViewController * incomeVC;
@property (nonatomic, assign) int type;

-(instancetype)initWithType:(int)type;

@end